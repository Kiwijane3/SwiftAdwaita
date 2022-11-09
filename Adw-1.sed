s/Adw.TabViewShortcuts/TabViewShortcuts/
s/adw_about_window_set_documenters(about_window_ptr, newValue)/adw_about_window_set_documenters(about_window_ptr, UnsafeMutablePointer(mutating: newValue))/
s/adw_about_window_set_developers(about_window_ptr, newValue)/adw_about_window_set_developers(about_window_ptr, UnsafeMutablePointer(mutating: newValue))/
s/adw_about_window_set_designers(about_window_ptr, newValue)/adw_about_window_set_designers(about_window_ptr, UnsafeMutablePointer(mutating: newValue))/
s/adw_about_window_set_artists(about_window_ptr, newValue)/adw_about_window_set_artists(about_window_ptr, UnsafeMutablePointer(mutating: newValue))/
s/GtkInputHints/Gtk.InputHints/