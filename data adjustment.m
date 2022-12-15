myFolder_38 = 'D:\NCAI-Neurocomputation Lab\Custom tDCS Experiments\MindFoster_tDCS_Paper\Data\test\38-GND original rec\'
Files_dir_38_EC =dir(fullfile(myFolder_38,'*.set'));
%hbv
EEG_Data_38_EC = {}

for k = 1:(length(Files_dir_38_EC))
    
    name = strcat(myFolder_38, Files_dir_38_EC(k).name);
    EEG_38_EC = pop_loadset(name);   
    EEG_Data_38_EC{k} = EEG_38_EC;
        
end

Adj_EEG = {}
EEG_Data_38{6}.setname % AQ EO2
EEG_Data_38{44}.setname % AN EO1

EEG_Data_38_EC{6}.setname % AQ EC2
EEG_Data_38_EC{44}.setname % AN EC1

Fz = 6;
F3 = 5;
F4 = 7; 
Fpz = 2;

arr = [Fpz, F3, Fz, F4]; 
for o = [6,44];
        
    for g = 1:4

        dat(g,:) = EEG_Data_38{o}.data(arr(g),:);

    end

    datm = mean(dat);

    for i = 1:38

        EEG_Data_38{o}.data(i,:) =  EEG_Data_38{o}.data(i,:) + datm(1,:);

    end
    datm = 0;
    dat = 0;
end 

pop_saveset(EEG_Data_38_EC{6}, 'S12_Ayesha_Qazi_Pre_EC2.set','D:\NCAI-Neurocomputation Lab\Custom tDCS Experiments\MindFoster_tDCS_Paper\Data\test');

