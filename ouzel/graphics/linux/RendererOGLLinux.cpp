// Copyright (C) 2016 Elviss Strazdins
// This file is part of the Ouzel engine.

#include "RendererOGLLinux.h"
#include "core/Engine.h"
#include "core/linux/WindowLinux.h"

namespace ouzel
{
    namespace graphics
    {
        RendererOGLLinux::~RendererOGLLinux()
        {
        }

        void RendererOGLLinux::free()
        {
        }

        bool RendererOGLLinux::init(const WindowPtr& window,
                                    uint32_t newSampleCount,
                                    TextureFilter newTextureFilter,
                                    PixelFormat newBackBufferFormat,
                                    bool newVerticalSync)
        {
            free();

            return RendererOGL::init(window, newSampleCount, newTextureFilter, newBackBufferFormat, newVerticalSync);
        }

        bool RendererOGLLinux::present()
        {
            if (!RendererOGL::present())
            {
                return false;
            }

            std::shared_ptr<WindowLinux> windowLinux = std::static_pointer_cast<WindowLinux>(sharedEngine->getWindow());

            glXSwapBuffers(windowLinux->getDisplay(), windowLinux->getNativeWindow());

            return true;
        }
    } // namespace graphics
} // namespace ouzel