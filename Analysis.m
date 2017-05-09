
%open text file, a matrix of numbers
Data=importdata('SimResults.xlsx');

% 1 - Participant number Description100 
% 2 - Dexscription100
% 3 - Desc one time
% 4 - exp 100 with total
% 5 - exp 100 without total

% make mean for each condition of taking the risky choice
% Compute also standart diviation 


MeanDesc100 = mean(Data.data(:,2));
MeanDesOnetime = mean(Data.data(:,3));
MeanExp100WithT = mean(Data.data(:,4));
MeanDesc100NoT = mean(Data.data(:,5));

STDDesc100 = std(Data.data(:,2));
STDDesOnetime = std(Data.data(:,3));
STDExp100WithT = std(Data.data(:,4));
STDDesc100NoT = std(Data.data(:,5));

%T-test between the conditions to see that:
%Expirience took less risks (becasue they less overestimated the chances)
%Description 100 times with total took more risks (Overestimated the chances)
%Description 100 times without total took also more risks and no differnce
%with or without total. 
% 1 - desc100 is higher than exp100 with total
% 2 - desc100 is higher than exp100 without total
% 3 - exp100 with and without total are not different. 

%If h=1, so look at t statistic.
%If T is positive, so the first input (left) is bigger than the second
%(right)
%If T is negative, so the first is lower than second

[h1,p1,ci1,stats1]=ttest2(Data.data(:,2),Data.data(:,4));
[h2,p2,ci2,stats2]=ttest2(Data.data(:,2),Data.data(:,5));
[h3,p3,ci3,stats3]=ttest2(Data.data(:,4),Data.data(:,5));

% PLOT THE DATA 

subplot(1,3,1), bar(MeanDesc100);
subplot(1,3,2), bar(MeanExp100WithT);
subplot(1,3,3), bar(MeanDesc100NoT);