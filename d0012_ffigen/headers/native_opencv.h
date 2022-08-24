#ifndef __NATIVE_OPENCV_H__
#define __NATIVE_OPENCV_H__

#if defined(__GNUC__)
// Attributes to prevent 'unused' function from being removed and to make it visible
#define FUNCTION_ATTRIBUTE __attribute__((visibility("default"))) __attribute__((used))
#elif defined(_MSC_VER)
// Marking a function for export
#define FUNCTION_ATTRIBUTE __declspec(dllexport)
#endif



FUNCTION_ATTRIBUTE
const char *version();

FUNCTION_ATTRIBUTE
void process_image(char *inputImagePath, char *outputImagePath);


#endif