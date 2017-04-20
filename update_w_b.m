function gpu_net = update_w_b (gpu_net, res_back, lr, N,batch_size)
    weight_decay = 5*1e-4 ;
    n_layers = 20;
    %batch_size = 128 ;
    for ii = 1:n_layers
            if isfield(gpu_net.layers{ii},'weights') & size(gpu_net.layers{ii}.weights,2)>=1
                    gpu_net.layers{ii}.weights{1} = gpu_net.layers{ii}.weights{1}+...
                        lr*(res_back(ii).dzdw{1}/(N*batch_size) - weight_decay*gpu_net.layers{ii}.weights{1});
                    gpu_net.layers{ii}.weights{2} = gpu_net.layers{ii}.weights{2}+...
                        lr*(res_back(ii).dzdw{2}/(N*batch_size) - weight_decay*gpu_net.layers{ii}.weights{2});
            end
    end
end
