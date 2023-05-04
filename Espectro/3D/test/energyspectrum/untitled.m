clc
clear
close all
for Re=1000:400:5000
        j = 1;
    for i=15.3125:0.3125:30
        energy(8,5/3,100,i);
        title(['t=',num2str(i)]);
        frame(j)=getframe(gcf);
        % drawnow
        j=j+1;
        close all 
    end
    
    writerObj = VideoWriter(['Espectro_EvolucionRe',num2str(Re),'.mp4'],'MPEG-4');
    writerObj.FrameRate = 5;
    
    
    open(writerObj);
    
    for i=1:length(frame)
        fra = frame(i);
        writeVideo(writerObj,fra);
    end
    
    close(writerObj);
end