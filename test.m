function [map,B_dataset,B_test] = test(net, dataset_L, test_L,data_set, test_data )
    [B_dataset, B_test] = compute_B (data_set,test_data,net) ;
    cnt = 0;
    S = compute_S(dataset_L,test_L) ;
    map = return_map (B_dataset, B_test, S) ;
end
