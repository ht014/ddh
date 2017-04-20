function [map,B_dataset,B_test] = test(net, dataset_L, test_L,data_set, test_data )
    [B_dataset, B_test] = compute_B (data_set,test_data,net) ;
    cnt = 0;
    %for i =1:10
    %    i
    %    N_B_D_Test(1+(i-1)*900:(i)*900,:) = B_dataset(1+(i-1)*5900:(i-1)*5900+900,:);
    %    N_B_D_L_Test(1+(i-1)*900:i*900,:) = dataset_L(1+(i-1)*5900:(i-1)*5900+900,:);
    %    N_B_D_Train(1+(i-1)*5000:i*5000,:) = B_dataset(1+900+(i-1)*5900:900+(i-1)*5900+5000,:);
    %    N_B_D_L_Train(1+(i-1)*5000:i*5000,:) = dataset_L(1+900+(i-1)*5900:900+(i-1)*5900+5000,:);
    %end
    %B_dataset =N_B_D_Train;
    %dataset_L = N_B_D_L_Train;
    %B_test = [B_test;N_B_D_Test];
    %test_L = [test_L;N_B_D_L_Test];
    
    S = compute_S(dataset_L,test_L) ;
    %size(B_dataset)
    %size(B_test)
    %size(test_L)
    %size(dataset_L)
    map = return_map (B_dataset, B_test, S) ;
end
