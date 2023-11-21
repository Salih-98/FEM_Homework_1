function writeResultsToTxt()

% Get the list of variable names in the base workspace
workspace_vars = evalin('base', 'who');

% Specify the file name
filename = 'output.txt';

% Check if the file already exists and delete it
if exist(filename, 'file')
    delete(filename);
end

% Open the file for writing
fid = fopen(filename, 'w');

% Write variable names and values to the file
for i = 1:length(workspace_vars)
    var_name = workspace_vars{i};
    var_value = evalin('base', var_name);

    % Write variable name and value on a new line
    fprintf(fid, '%s = ', var_name);

    % Check if the variable is numeric
    if isnumeric(var_value)
        % Check if it's a matrix
        if ismatrix(var_value)
            % Display the matrix using fprintf
            fprintf(fid, '[\n');
            for row = 1:size(var_value, 1)
                fprintf(fid, '  ');
                fprintf(fid, '%g ', var_value(row, :));
                fprintf(fid, '\n');
            end
            fprintf(fid, ']\n');
        else
            % Display numeric variables
            fprintf(fid, '%g\n', var_value);
        end
    elseif isa(var_value, 'sym')  % Check if the variable is symbolic
      % Display symbolic variables using fprintf
        var_str = char(var_value);
        % Replace semicolons and periods with new line characters
        var_str = strrep(var_str, ';', sprintf('\n'));
        var_str = strrep(var_str, '.', sprintf('\n'));
        fprintf(fid, '%s\n', var_str);
    elseif iscell(var_value)  % Check if the variable is a cell array
        % Display cell arrays using fprintf
        fprintf(fid, '{%s}\n', strjoin(var_value, ', '));
    else
        % Handle non-numeric variables (e.g., strings)
        fprintf(fid, '%s\n', var_value);
    end
end

% Close the file
fclose(fid);

end

