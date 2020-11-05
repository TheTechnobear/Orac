#pragma once

#include <string>
#include <memory>

namespace TTuiLite {


//Note: only display functions work at this time!

class TTuiCallback {
public:
    TTuiCallback() { ; }

    virtual ~TTuiCallback() = default;
    virtual void onButton(unsigned id, unsigned value) = 0;
    virtual void onPot(unsigned id, unsigned value) = 0;
    virtual void onTrig(unsigned id, unsigned value) = 0;
};


class TTuiDeviceImpl_;

enum TTDevType {
    TT_Normal,
    TT_zerOrac
};

class TTuiDevice {
public:


    TTuiDevice(TTDevType type=TT_Normal);
    ~TTuiDevice();

    void start();
    void stop();
    unsigned process(bool paint = true);
    void addCallback(std::shared_ptr<TTuiCallback>);
    bool buttonState(unsigned but);
    unsigned numPots();
    unsigned numButtons();
    unsigned numTrigs();
    unsigned numGateOut();

    void gpioSmoothing(unsigned);
    void gpioDeadband(unsigned);
    void gpioPollTime(unsigned); // uSec, defaults 1000

    void gateOut(unsigned,bool);
    void ledOut(bool);

    void displayClear(unsigned d);
    void displayPaint();
    // draw funcs
    void gClear(unsigned d, unsigned clr);
    void gSetPixel(unsigned d, unsigned clr, unsigned x, unsigned y);
    void gFillArea(unsigned d, unsigned clr, unsigned x, unsigned y, unsigned w, unsigned h);
    void gCircle(unsigned d, unsigned clr, unsigned x, unsigned y, unsigned r);
    void gFilledCircle(unsigned d, unsigned clr, unsigned x, unsigned y, unsigned r);
    void gLine(unsigned d, unsigned clr, unsigned x1, unsigned y1, unsigned x2, unsigned y2);
    void gRectangle(unsigned d, unsigned clr, unsigned x, unsigned y, unsigned w, unsigned h);
    void gInvert(unsigned d);
    void gText(unsigned d, unsigned clr, unsigned x, unsigned y, const std::string &str);
    void gBitmap(unsigned d, unsigned x, unsigned y, const char *filename);
    // void gWaveform(unsigned d, unsigned clr, const std::vector<unsigned> &wave); // 128 values, of 0..64
    // void gInvertArea(unsigned d, unsigned x, unsigned y, unsigned w, unsigned h);
    // void gPng(unsigned d, unsigned x, unsigned y, const char *filename);

    // simple text displays
    void textLine(unsigned d,unsigned clr, unsigned line, unsigned col, const std::string &str);
    void clearLine(unsigned d, unsigned clr, unsigned line);
    // void invertLine(unsigned line);

private:
    TTuiDeviceImpl_ *impl_;
};


}
