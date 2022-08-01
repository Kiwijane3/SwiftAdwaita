import Gtk
import Adwaita

let app = Adwaita.Application(applicationId: "co.luoja.adwaita.demo", flags: .none)
let result = app.run() { appRef in
	let window = ApplicationWindow(app: appRef)
	let label = Label(text: "Test")
	window.set(content: label)
	window.setDefaultSize(width: 400, height: 300)
	window.show()
}