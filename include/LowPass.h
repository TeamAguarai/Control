namespace pampas {
    
class LowPass {
private:
    double alpha;       // Coeficiente de suavizado
    double prevOutput = 0.0;  // Última salida (x_{n-1})

public:
    void setAlpha(double value);
    double filter(double input);
};

}