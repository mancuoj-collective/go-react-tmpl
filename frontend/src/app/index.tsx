import { DarkModeToggle } from '@/components/dark-mode-toggle'
import { Button } from '@/components/ui/button'

import { AppProvider } from './provider'

export function App() {
  return (
    <AppProvider>
      <div className="flex min-h-svh flex-col items-center justify-center gap-5">
        <div className="font-dm text-2xl font-semibold">Go - React - Tmpl</div>
        <div className="space-x-2">
          <Button variant="outline" size="icon" asChild className="rounded-full">
            <a href="https://github.com/mancuoj-collective/go-react-tmpl">
              <span className="i-carbon-logo-github" />
            </a>
          </Button>
          <DarkModeToggle className="rounded-full" />
        </div>
      </div>
    </AppProvider>
  )
}
