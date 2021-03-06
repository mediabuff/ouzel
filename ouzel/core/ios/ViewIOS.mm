// Copyright (C) 2017 Elviss Strazdins
// This file is part of the Ouzel engine.

#import "ViewIOS.h"
#include "core/Engine.hpp"
#include "core/Window.hpp"
#include "input/ios/InputIOS.hpp"

@implementation ViewIOS

-(void)touchesBegan:(NSSet*)touches withEvent:(__unused ::UIEvent*)event
{
    for (UITouch* touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        CGFloat force = 1.0;
        if ([touch respondsToSelector:@selector(force)] && [touch respondsToSelector:@selector(maximumPossibleForce)])
            force = (touch.maximumPossibleForce > 0.0f) ? touch.force / touch.maximumPossibleForce : 0.0f;

        ouzel::sharedEngine->getInput()->touchBegin(reinterpret_cast<uint64_t>(touch),
                                                    ouzel::sharedEngine->getWindow()->convertWindowToNormalizedLocation(ouzel::Vector2(static_cast<float>(location.x),
                                                                                                                                       static_cast<float>(location.y))),
                                                    static_cast<float>(force));
    }
}

-(void)touchesMoved:(NSSet*)touches withEvent:(__unused ::UIEvent*)event
{
    for (UITouch* touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        CGFloat force = 1.0;
        if ([touch respondsToSelector:@selector(force)] && [touch respondsToSelector:@selector(maximumPossibleForce)])
            force = (touch.maximumPossibleForce > 0.0f) ? touch.force / touch.maximumPossibleForce : 0.0f;

        ouzel::sharedEngine->getInput()->touchMove(reinterpret_cast<uint64_t>(touch),
                                                   ouzel::sharedEngine->getWindow()->convertWindowToNormalizedLocation(ouzel::Vector2(static_cast<float>(location.x),
                                                                                                                                      static_cast<float>(location.y))),
                                                   static_cast<float>(force));
    }
}

-(void)touchesEnded:(NSSet*)touches withEvent:(__unused ::UIEvent*)event
{
    for (UITouch* touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        CGFloat force = 1.0;
        if ([touch respondsToSelector:@selector(force)] && [touch respondsToSelector:@selector(maximumPossibleForce)])
            force = (touch.maximumPossibleForce > 0.0f) ? touch.force / touch.maximumPossibleForce : 0.0f;

        ouzel::sharedEngine->getInput()->touchEnd(reinterpret_cast<uint64_t>(touch),
                                                  ouzel::sharedEngine->getWindow()->convertWindowToNormalizedLocation(ouzel::Vector2(static_cast<float>(location.x),
                                                                                                                                     static_cast<float>(location.y))),
                                                  static_cast<float>(force));
    }
}

-(void)touchesCancelled:(NSSet*)touches withEvent:(__unused ::UIEvent*)event
{
    for (UITouch* touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        CGFloat force = 1.0;
        if ([touch respondsToSelector:@selector(force)] && [touch respondsToSelector:@selector(maximumPossibleForce)])
            force = (touch.maximumPossibleForce > 0.0f) ? touch.force / touch.maximumPossibleForce : 0.0f;

        ouzel::sharedEngine->getInput()->touchCancel(reinterpret_cast<uint64_t>(touch),
                                                     ouzel::sharedEngine->getWindow()->convertWindowToNormalizedLocation(ouzel::Vector2(static_cast<float>(location.x),
                                                                                                                                        static_cast<float>(location.y))),
                                                     static_cast<float>(force));
    }
}

-(void)pressesBegan:(NSSet<UIPress*>*)presses withEvent:(__unused UIPressesEvent*)event
{
    for (UIPress* press in presses)
    {
        ouzel::sharedEngine->getInput()->keyPress(ouzel::input::InputIOS::convertKeyCode(press.type), 0);
    }
}

-(void)pressesEnded:(NSSet<UIPress*>*)presses withEvent:(__unused UIPressesEvent*)event
{
    for (UIPress* press in presses)
    {
        ouzel::sharedEngine->getInput()->keyRelease(ouzel::input::InputIOS::convertKeyCode(press.type), 0);
    }
}

-(void)pressesCancelled:(NSSet<UIPress*>*)presses withEvent:(__unused UIPressesEvent*)event
{
    for (UIPress* press in presses)
    {
        ouzel::sharedEngine->getInput()->keyRelease(ouzel::input::InputIOS::convertKeyCode(press.type), 0);
    }
}

@end
