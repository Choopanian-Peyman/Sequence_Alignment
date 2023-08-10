clc
clear all
%      Created at Fall, 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Scoring system and Initialization
match = 1; 
mismatch = -2;
gap = -2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
seq1 = 'FKHMEDPLE';
seq2 = 'FMDTPLNE';
m = length(seq1);
n = length(seq2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      fill the score matrix
ScoreMat = zeros(m+1,n+1);
for i = 2:m+1
    ScoreMat(i,1) = (i-1)*gap;
end
for i = 2:n+1
    ScoreMat(1,i) = (i-1)*gap;
end
for i = 2:m+1
    for j = 2:n+1
        if seq1(i-1)==seq2(j-1)
            S = match;
        else
            S = mismatch;
        end
        ScoreMat(i,j) = max([ScoreMat(i-1,j-1)+S, ScoreMat(i-1,j)+gap, ScoreMat(i,j-1)+gap]);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      back tracing
i = m+1;
j = n+1;
A = repelem('z',i+j);
B = repelem('z',i+j);
x = zeros(1,i+j); y = zeros(1,i+j);
u = zeros(1,i+j); v = zeros(1,i+j);
k=1;
while i > 1 && j > 1
    if seq1(i-1)==seq2(j-1)
       S = match;
     else
       S = mismatch;
    end
    x(k) = j; y(k) = i; 
    if ScoreMat(i,j) == ScoreMat(i-1,j-1)+S
        u(k) = -1; v(k) = -1;
        A(k) = seq1(i-1);
        B(k) = seq2(j-1);
        i = i-1;
        j = j-1;
    else if ScoreMat(i,j) == ScoreMat(i-1,j)+gap
            v(k) = -1;
            A(k) = seq1(i-1);
            B(k) = '-';
            i = i-1;
        else if ScoreMat(i,j) == ScoreMat(i,j-1)+gap
            u(k) = -1;
            A(k) = '-';
            B(k) = seq2(j-1);
            j = j-1;
            end
        end
    end
    k = k+1;
end
x = x(1:k-1); y = y(1:k-1);
u = u(1:k-1); v = v(1:k-1);
A = A(1:k-1); B = B(1:k-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Visualization of the back tracing path on the score matrix. 
figure;
imagesc(ScoreMat)
colorbar;
hold on
quiver(x,y,u,v,0.25,'LineWidth',1.5,'Color','r');
title('Back tracing path on the score matrix');
set(gca,'XTickLabel', str2cell(seq2));
xlabel('Sequence 2');
set(gca,'YTickLabel', str2cell(seq1));
ylabel('Sequence 1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Show alignment
i = 1;
for j = length(A):-1:1
    Align(1,i) = A(j);
    if A(j) == B(j)
        Align(2,i) = '|';
    end
    Align(3,i) = B(j);
    i = i+1;
end
Iden = (numel(find(Align(2,:)=='|'))/length(Align))*100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Align
disp(['Alignment Score = ',num2str(ScoreMat(end))])
disp(['Alignment Identity = ',num2str(Iden), ' %'])