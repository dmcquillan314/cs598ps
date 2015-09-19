function p1( )
    imagepath = 'myself.jpg';
    reductionFactor = 0.2;
    
    T = p1Transform(imagepath, reductionFactor);
    
    figure;
    
    image(T);

end

