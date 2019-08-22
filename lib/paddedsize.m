function PQ = paddedsize(AB, CD, PARAM)
% �������ߴ��Թ�����FFT���˲���
% PQ = PADDEDSIZE(AB),AB = [A B], PQ = 2 * AB
%
% PQ = PADDEDSIZE(AB, 'PWR2')�� PQ��1�� = PQ��2�� = 2 ^ nextpow2(2 * m), m =
% MAX(AB).
% 
% PQ = PADDEDSIZE(AB, CD)��AB = [A B], CD = [C D]
%
%  PQ = PADDEDSIZE(AB, CD, 'PWR2')�� PQ��1�� = PQ��2�� = 2 ^ nextpow2(2 * m), m =
% MAX([AB CD]).

if nargin == 1
    PQ = 2 * AB;
elseif nargin == 2 & ~ischar(CD)
    PQ = AB + CD -1;
    PQ = 2 * ceil(PQ / 2);  % ceil��N�����ر�N�����С������Ϊ�˱��������������Ϊ����ż�������
elseif nargin == 2
    m = max(AB);
    P = 2 ^ nextpow2(2 * m);  % nextpow2��N�����ص�һ��P��ʹ��2. ^ P> = abs��N���� 
    % ����FFT���㣬�ҵ���ӽ��������г��ȵ�2 ���ݴη�ͨ�������á�
    PQ = [P, P];
elseif nargin == 3
    m = max([AB CD]);
    P = 2 ^ nextpow2(2 * m);
    PQ = [P, P];
else
    error('Wrong number of input')
end