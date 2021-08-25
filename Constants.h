//
//  Constants.h
//

#define APPD ((SFAppDelegate *)[[UIApplication sharedApplication] delegate])
#define IPHONE UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone

#define Deg2Rad(deg) (float)(deg*M_PI/180.)
#define Rad2Deg(rad) (float)(rad*180./M_PI)

#include <TargetConditionals.h>
#if TARGET_RT_BIG_ENDIAN
#   define FourCC2Str(fourcc) (const char[]){*((char*)&fourcc), *(((char*)&fourcc)+1), *(((char*)&fourcc)+2), *(((char*)&fourcc)+3),0}
#else
#   define FourCC2Str(fourcc) (const char[]){*(((char*)&fourcc)+3), *(((char*)&fourcc)+2), *(((char*)&fourcc)+1), *(((char*)&fourcc)+0),0}
#endif
#define SCREEN_WIDTH fmax(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)
#define SCREEN_HEIGHT fmin(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)
