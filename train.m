function [net, U, B] = train_nus(X, U, net, iter , lr,lambda,codelens,S)
    batchsize = 50 ;
    N = size(X,4) ;
    index = randperm(N) ;
    for j = 0:ceil(N/batchsize)-1
        batch_time=tic ;
        %% random select a minibatch
        ix = index((1+j*batchsize):min((j+1)*batchsize,N)) ;
        SS=double(S(ix,1:N));
        im = X(:,:,:,ix) ;
        im_ = single(im) ; 
        im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
        im_ = im_ - repmat(net.meta.normalization.averageImage,1,1,1,size(im_,4)) ;
        im_ = gpuArray(im_) ;
 
        res = vl_simplenn(net, im_) ;
        U0 = squeeze(gather (res(end).x))' ; 
        U(ix,:) = U0 ; 
        Loss = sum(sum  (  (U0*U'/codelens - SS).^2))+lambda*(sum(sum((U0-sign(U0)).^2)));
        Loss = Loss / N /batchsize;
       
        dJdU = - U0*U'*U/codelens/codelens + SS*U/codelens - lambda*(U0-sign(U0)); 
        dJdoutput = gpuArray(reshape(dJdU',[1,1,size(dJdU',1),size(dJdU',2)])) ;
      
        res = vl_simplenn( net, im_, dJdoutput) ;
        %% update the parameters of CNN
        net = update_w_b(net , res, lr, N,batchsize) ;
        batch_time = toc(batch_time) ;
        fprintf(' iter %d  batch %d/%d (%.1f images/s) ,lr is %d  loss is %f\n', iter, j+1,ceil(size(X,4)/batchsize), batchsize/ batch_time,lr,Loss) ;
    end
end
