echo off;
p = getenv('SLURM_NTASKS_PER_NODE');
parpool(10);

eegmat = 'eegmat/';
dimension1 = 64;
dimension2 = 64;

parfor i = 1:109
    folder = ['S' num2str(i, '%03.0f')];
    base1 = load([eegmat folder '/' folder 'R' num2str(1, '%02.0f') '.mat'], 'data');
    base2 = load([eegmat folder '/' folder 'R' num2str(2, '%02.0f') '.mat'], 'data');
    base1 = base1.data;
    base2 = base2.data;

    base3 = load([eegmat folder '/' folder 'R' num2str(3, '%02.0f') '.mat'], 'data');
    base3 = base3.data;
    
    base4 = load([eegmat folder '/' folder 'R' num2str(4, '%02.0f') '.mat'], 'data');
    base4 = base4.data;
    
    base5 = load([eegmat folder '/' folder 'R' num2str(5, '%02.0f') '.mat'], 'data');
    base5 = base5.data;
    
    base6 = load([eegmat folder '/' folder 'R' num2str(6, '%02.0f') '.mat'], 'data');
    base6 = base6.data;
    
    base7 = load([eegmat folder '/' folder 'R' num2str(7, '%02.0f') '.mat'], 'data');
    base7 = base7.data;
    
    base8 = load([eegmat folder '/' folder 'R' num2str(8, '%02.0f') '.mat'], 'data');
    base8 = base8.data;
    
    base9 = load([eegmat folder '/' folder 'R' num2str(9, '%02.0f') '.mat'], 'data');
    base9 = base9.data;
    
    base10 = load([eegmat folder '/' folder 'R' num2str(10, '%02.0f') '.mat'], 'data');
    base10 = base10.data;
    
    base11 = load([eegmat folder '/' folder 'R' num2str(11, '%02.0f') '.mat'], 'data');
    base11 = base11.data;
    
    base12 = load([eegmat folder '/' folder 'R' num2str(12, '%02.0f') '.mat'], 'data');
    base12 = base12.data;
    
    base13 = load([eegmat folder '/' folder 'R' num2str(13, '%02.0f') '.mat'], 'data');
    base13 = base13.data;
    
    base14 = load([eegmat folder '/' folder 'R' num2str(14, '%02.0f') '.mat'], 'data');
    base14 = base14.data;
    
    physFist = [base1 base2 base3 base7 base11];
    imagFist = [base1 base2 base4 base8 base12];
    physFeet = [base1 base2 base5 base9 base13];
    imagFeet = [base1 base2 base6 base10 base14];
    
    netphysFist = selforgmap([dimension1 dimension2]);
    netimagFist = selforgmap([dimension1 dimension2]);
    netphysFeet = selforgmap([dimension1 dimension2]);
    netimagFeet = selforgmap([dimension1 dimension2]);
    
    [netphysFist,tr] = train(netphysFist,physFist);
    [netimagFist,tr] = train(netimagFist,imagFist);
    [netphysFeet,tr] = train(netphysFeet,physFeet);
    [netimagFeet,tr] = train(netimagFeet,imagFeet);
    
    w = netphysFist(physFist);
    x = netimagFist(imagFist);
    y = netphysFeet(physFeet);
    z = netimagFeet(imagFeet);
    
    saveas(plotsomnd(netphysFist), ['output/' folder 'phyFistnd.png']);
    saveas(plotsomplanes(netphysFist), ['output/' folder 'phyFistplanes.png']);
    
    saveas(plotsomnd(netimagFist), ['output/' folder 'imagFistnd.png']);
    saveas(plotsomplanes(netimagFist), ['output/' folder 'imagFistplanes.png']);
    
    saveas(plotsomnd(netphysFeet), ['output/' folder 'phyFeetnd.png']);
    saveas(plotsomplanes(netphysFeet), ['output/' folder 'phyFeetplanes.png']);
    
    saveas(plotsomnd(netimagFeet), ['output/' folder 'imagFeetnd.png']);
    saveas(plotsomplanes(netimagFeet), ['output/' folder 'imagFeetplanes.png']);
end
