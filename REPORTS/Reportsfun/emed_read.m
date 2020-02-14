%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\maipa\Downloads\Test_Data_Report\Test_Data_Report\EMED\P001\P001_8.lst
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2020/02/01 10:03:52
filename= ('D:\P001_left.lst')
%% Initialize variables.

delimiter = '\t';
startRow = 9;

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false, 'EndOfLine', '\r\n');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
P0018 = table;
P0018.VarName1 = cell2mat(raw(:, 1));
P0018.VarName2 = cell2mat(raw(:, 2));
P0018.VarName3 = cell2mat(raw(:, 3));
P0018.VarName4 = cell2mat(raw(:, 4));
P0018.Page1 = cell2mat(raw(:, 5));
P0018.VarName6 = cell2mat(raw(:, 6));
P0018.VarName7 = cell2mat(raw(:, 7));
P0018.VarName8 = cell2mat(raw(:, 8));
P0018.VarName9 = cell2mat(raw(:, 9));
P0018.VarName10 = cell2mat(raw(:, 10));
P0018.VarName11 = cell2mat(raw(:, 11));
P0018.VarName12 = cell2mat(raw(:, 12));
P0018.VarName13 = cell2mat(raw(:, 13));
P0018.VarName14 = cell2mat(raw(:, 14));
P0018.VarName15 = cell2mat(raw(:, 15));
P0018.VarName16 = cell2mat(raw(:, 16));
P0018.VarName17 = cell2mat(raw(:, 17));
P0018.VarName18 = cell2mat(raw(:, 18));
P0018.VarName19 = cell2mat(raw(:, 19));
P0018.VarName20 = cell2mat(raw(:, 20));
P0018.VarName21 = cell2mat(raw(:, 21));
P0018.VarName22 = cell2mat(raw(:, 22));
P0018.VarName23 = cell2mat(raw(:, 23));
P0018.VarName24 = cell2mat(raw(:, 24));
P0018.VarName25 = cell2mat(raw(:, 25));
P0018.VarName26 = cell2mat(raw(:, 26));
P0018.VarName27 = cell2mat(raw(:, 27));
P0018.VarName28 = cell2mat(raw(:, 28));
P0018.VarName29 = cell2mat(raw(:, 29));
P0018.VarName30 = cell2mat(raw(:, 30));
P0018.VarName31 = cell2mat(raw(:, 31));
P0018.VarName32 = cell2mat(raw(:, 32));
P0018.VarName33 = cell2mat(raw(:, 33));
P0018.VarName34 = cell2mat(raw(:, 34));
P0018.VarName35 = cell2mat(raw(:, 35));
P0018.VarName36 = cell2mat(raw(:, 36));
P0018.VarName37 = cell2mat(raw(:, 37));
P0018.VarName38 = cell2mat(raw(:, 38));
P0018.VarName39 = cell2mat(raw(:, 39));
P0018.VarName40 = cell2mat(raw(:, 40));
P0018.VarName41 = cell2mat(raw(:, 41));
P0018.VarName42 = cell2mat(raw(:, 42));
P0018.VarName43 = cell2mat(raw(:, 43));
P0018.VarName44 = cell2mat(raw(:, 44));
P0018.VarName45 = cell2mat(raw(:, 45));
P0018.VarName46 = cell2mat(raw(:, 46));
P0018.VarName47 = cell2mat(raw(:, 47));
P0018.VarName48 = cell2mat(raw(:, 48));
P0018.VarName49 = cell2mat(raw(:, 49));
P0018.VarName50 = cell2mat(raw(:, 50));
P0018.VarName51 = cell2mat(raw(:, 51));
P0018.VarName52 = cell2mat(raw(:, 52));
P0018.VarName53 = cell2mat(raw(:, 53));
P0018.VarName54 = cell2mat(raw(:, 54));
P0018.VarName55 = cell2mat(raw(:, 55));
P0018.VarName56 = cell2mat(raw(:, 56));
P0018.VarName57 = cell2mat(raw(:, 57));
P0018.VarName58 = cell2mat(raw(:, 58));
P0018.VarName59 = cell2mat(raw(:, 59));
P0018.VarName60 = cell2mat(raw(:, 60));
P0018.VarName61 = cell2mat(raw(:, 61));
P0018.VarName62 = cell2mat(raw(:, 62));
P0018.VarName63 = cell2mat(raw(:, 63));
P0018.VarName64 = cell2mat(raw(:, 64));
P0018.VarName65 = cell2mat(raw(:, 65));
P0018.VarName66 = cell2mat(raw(:, 66));

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp R;


%%
verticalsensors = linspace(1,95,95);
horitontalsensors = linspace(1,64,64);


x = P0018.VarName1';
y = verticalsensors;

out = strfind(x, y) ;
clearvars Matrix
i=1;
temparray2=0;
while i<= length (out)
    matrixlocation(i,:) = [out(1,i), out(1,i)+94]
    
    framen = strcat ('frameno', num2str(i));
    Matrix.(framen) = P0018((matrixlocation(i,1)):(matrixlocation(i,end)),(2:end-1));
    temparray = table2array (P0018((matrixlocation(i,1)):(matrixlocation(i,end)),(2:end-1)));
    temparray2 = temparray2+temparray;
    % figure(1)
    % surf(temparray, 'EdgeColor','None', 'facecolor', 'interp');
    % hold on
    % view(180,90)
    % axis off
    % colorbar
    i = i+1;
end
temparray2= temparray2;
