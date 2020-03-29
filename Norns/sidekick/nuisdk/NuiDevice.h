#pragma once

#include <vector>
#include <string>
#include <memory>

namespace NuiLite {


class NuiCallback {
public:
    NuiCallback() { ; }

    virtual ~NuiCallback() = default;
    virtual void onButton(unsigned id, unsigned value) = 0;
    virtual void onEncoder(unsigned id, int value) = 0;
};


class NuiDeviceImpl_;

class NuiDevice {
public:
    NuiDevice(const char *resourcePath = nullptr);
    ~NuiDevice();

    void start();
    void stop();
    unsigned process(bool paint = true);
    void addCallback(std::shared_ptr<NuiCallback>);

    bool buttonState(unsigned but);
    unsigned numEncoders();

    void displayClear();
    void displayPaint();

    // new api
    void gClear(unsigned clr);
    void gSetPixel(unsigned clr, unsigned x, unsigned y);
    void gFillArea(unsigned clr, unsigned x, unsigned y, unsigned w, unsigned h);
    void gCircle(unsigned clr, unsigned x, unsigned y, unsigned r);
    void gFilledCircle(unsigned clr, unsigned x, unsigned y, unsigned r);
    void gLine(unsigned clr, unsigned x1, unsigned y1, unsigned x2, unsigned y2);
    void gRectangle(unsigned clr, unsigned x, unsigned y, unsigned w, unsigned h);
    void gInvert();
    void gText(unsigned clr, unsigned x, unsigned y, const std::string &str);
    void gWaveform(unsigned clr, const std::vector<unsigned> &wave); // 128 values, of 0..64
    void gInvertArea(unsigned x, unsigned y, unsigned w, unsigned h);
    void gPng(unsigned x, unsigned y, const char *filename);

    void textLine(unsigned clr, unsigned line, unsigned col, const std::string &str);
    void invertLine(unsigned line);
    void clearLine(unsigned clr, unsigned line);

    // old api, consider deprecated 
    void clearRect(unsigned clr, unsigned x, unsigned y, unsigned w, unsigned h);
    void drawText(unsigned clr, unsigned x, unsigned y, const std::string &str);
    void drawPNG(unsigned x, unsigned y, const char *filename);
    void displayText(unsigned clr, unsigned line, unsigned col, const std::string &str);
    void clearText(unsigned clr, unsigned line);
    void invertText(unsigned line);
private:
    NuiDeviceImpl_ *impl_;
};


}
