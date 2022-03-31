% This script fits an L1-regularized generalized linear model (L1-GLM) to
% to neuronal spike train responses of a single auditory neuron probed with
% bird songs. The learned model is then used to predict the response of this
% neuron to a novel stimulus. Please see the manuscript included in this
% directory (L1-GLM.pdf) for details about the method and notation.
% Use this code at your own risk but please reference our work.

% add all the necessary functions to the path
addpath(genpath(pwd));

for k = 1:32
    load(sprintf('C:\\Users\\rodr0283\\Documents\\GitHub\\SONICLab\\Decoding\\calabrese_datasets\\myData_%2.0f.mat',k))
    % train model
    tic;
    disp('Estimating model parameters ...')
    
    %K = train_model(myData);
    
    % test model and plot results
    disp('Predicting response ...')
    figgy =  test_glm(K, myData);
    toc
    
    fig = get(gcf);
    title_obj = get(fig.Children(6),'title');
    title_obj.String = ['BF: ' num2str(bf)  ' kHz'];
    
    savefig(figgy,sprintf('C:\\Users\\rodr0283\\Documents\\GitHub\\calabrese_results\\model_for_cell_%2.0f',k))
    save(sprintf('C:\\Users\\rodr0283\\Documents\\GitHub\\calabrese_results\\model_for_cell_%2.0f',k),'K')
end