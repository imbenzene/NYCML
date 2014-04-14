function [X, Y] = svmlread(fname)
 % svmlread - converts svmlib/light txt format data to matlab data
 %
 % [X, Y] = svmlread(fname)
 % X is a sparse matrix
 % Y is a column vector of labels (tags)
 %
 % author: Ron Begleiter
 
 
 error(nargchk(1, 1, nargin));
 
 X = [];
 Y = [];
 
 fid = fopen(fname, 'rt');
 if (fid<0),
   error(sprintf('failed to open file %s', fname));
 end
 
 % round 1 - finding max feature; num instances; is sparse;
 numInstances = 0;
 NoZeros = 0;
 Nfeatures = -1;
 while ~feof(fid),
   s = fgetl(fid);
   [Yi, count, errmsg, nextind] = sscanf(s, '%f', 1);  
   [Xi, count] = sscanf(s(nextind:end), ' %i:%f');
   inxs = (2:2:length(Xi))-1; % easiest way to grab indices
   maxCol = max(Xi(inxs));
   if (maxCol>Nfeatures)
       Nfeatures = maxCol;      
   end
   NoZeros = NoZeros + (count/2);
   numInstances = numInstances+1;
 end
 fclose(fid);
 
 
 % round 2 - start working
 Nzeros = numInstances*Nfeatures - NoZeros;
 
 if Nzeros > NoZeros
     disp(['working with sparse matrices: num zeros=' num2str(Nzeros) ' num non zeros=' num2str(NoZeros)]);
     X = spalloc(Nfeatures, numInstances, NoZeros);%working columnwise for simplicity at end doing transpose
 else
     X = zeros(Nfeatures, numInstances);%working columnwise for simplicity at end doing transpose
 end
 
 fid = fopen(fname, 'rt');
if (fid<0),
   error(sprintf('Unable to open file %s', fname));
end

i = 0;
while ~feof(fid),
     s = fgetl(fid);
     
     % ignore empty lines
     if length(s)==0,
         continue;
     end
     
     
     [Yi, count, errmsg, nextind] = sscanf(s, '%f', 1);  % scan class label
     if (count==1),
         i = i+1;
         Y(i,1) = Yi; % label
         [Xi, count] = sscanf(s(nextind:end), ' %i:%f');        
         if (count~=0), % otherwise an all zeros vector
             indxs = 2:2:count;
             X(Xi(indxs-1),i) = Xi(indxs); % indxs-1 corresponds feature indices and
                                           % indxs corresponds their values
         end
     end
 end
 
 fclose(fid);
 X = X';
