%% 人口比较图

%% 中国人口年龄性别比，来源：中国国家统计局
data = readmatrix('A0301a.xls','Range','B7:H126');
populations = data(:,2:3);
populations(1:6:end,:) = [];
ages = 0:99;

%% plot
figure('Color','white');
ax = axes;
b1 = barh(ax,ages,-populations(:,1));
hold on;
text(ax,b1.YEndPoints+0.3,b1.XEndPoints,string(b1.XEndPoints)+"岁",'HorizontalAlignment','right');
b2 = barh(ax,ages,populations(:,2));
text(ax,b2.YEndPoints-0.3,b2.XEndPoints,string(b2.XEndPoints)+"岁",'HorizontalAlignment','left');
Proportion = round(populations(:,1)./populations(:,2)*100);
ProportionStr = string(Proportion)+":100";
text(ax,0*ages,b1.XEndPoints,ProportionStr,'HorizontalAlignment','center',...
    'FontSize',10,'FontWeight','bold');

ax.XAxis.Exponent = 0;% prevent scientific notation
ax.XAxis.LineWidth = 2;
ax.Box = 'off';
ax.XGrid = 'on';
ax.YAxis.Visible = 'off';
ax.XTick = [-1.5*10^7,-1*10^7,-5*10^6,0,5*10^6,1*10^7,1.5*10^7];
ax.XTickLabel = ["1500万","1000万","500万","0","500万","1000万","1500万"];
ax.XAxis.FontSize=20;
legend(ax,["男","女"]);
title('中国人口年龄性别比')

