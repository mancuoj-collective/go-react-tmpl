import { Provider } from 'jotai'
import type { PropsWithChildren } from 'react'

import { TwScreenIndicator } from '@/components/tw-screen-indicator'
import { Toaster } from '@/components/ui/sonner'

export function AppProvider({ children }: PropsWithChildren) {
  return (
    <Provider>
      <div className="font-sans antialiased">
        {children}
        <Toaster richColors position="bottom-center" />
        <TwScreenIndicator />
      </div>
    </Provider>
  )
}
