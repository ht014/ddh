clear;
codes_len=[16,32,64];
for jk=1:3
codelens=codes_len(jk);
%% load the pre-trained CNN
net = load('imagenet-vgg-f.mat') ;#pretrain model
%% load the Dataset
load('cifar-10.mat') ;
%% initialization
maxIter = 100;
lambda = 15;
lr = logspace(-2,-6,maxIter) ;
net = net_structure (net, codelens);
U = zeros(size(train_data,4),codelens);
B = zeros(size(train_data,4),codelens);
load('S_K1_20_K2_30.mat');%similarity matrix
for iter = 1: maxIter
    [net, U] = train(train_data,train_L,U,net,iter,lr(iter),lambda,codelens,S) ;
%% testing
[map,B_dataset,B_test] = test(net, dataset_L, test_L,data_set, test_data );
save(['DPSH_CIFAR_10_' num2str(codelens) '_bits.mat'],'B_dataset','B_test','map','net');
end
