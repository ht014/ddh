# ddh <p>
To run this code, you should do the follow things:<p>
1.Download mat-convnet, which is matlab deep learning lib. After that, you should complie it and add path to you project.<p>
2.Extract deep feature,here you can use caffe ,tensorflow and theano etc. with pretrained model to extract feature.<p>
3.Run construct_s.py to construct similarity matrix and some parameters should change in code.You can download cifar-10.mat training data and cifar_KNN.npz from <a href="http://pan.baidu.com/s/1geUCy0F"> here </a> .<p>
4.Run DDH.m to train network , which will output map and hash codes.<p>
