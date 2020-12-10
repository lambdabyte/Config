from ranger.api.commands import *


class addpane(Command):
    """Opens selected file in new tmux pane in existing target window"""

    def execute(self):
        # If no arguments entered
        if not self.arg(1):
            self.fm.notify('addpane <target-window> [orientation h/v]', bad=True)
            return
        # Default orientation, horizontal
        orient_flag = 'h'
        # If orientation entered
        if self.arg(2):
            orient_flag = str(self.arg(2))
            # Invalid orientation argument
            if orient_flag != 'h' and orient_flag != 'v':
                self.fm.notify('addpane <target-window> [orientation h/v]', bad=True) 
                return
        # Create new temporary window with selected file
        self.fm.execute_console('shell tmux neww -n "new_window" vim ' + str(self.fm.thisfile))
        # Add temporary window as pane to target window
        self.fm.execute_console('shell tmux join-pane -' + orient_flag + ' -s "new_window" -t ' + str(self.arg(1)))        
