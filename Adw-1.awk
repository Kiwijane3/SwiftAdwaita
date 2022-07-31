#!/usr/bin/awk
#
# Patch the generated wrapper Swift code to handle special cases
#
BEGIN { comment = 0; overrideInit = 0; }
/^open class ActionRow / { overrideInit = 1 }
/^open class ComboRow / { overrideInit = 1 }
/^open class ExpanderRow / { overrideInit = 1 }
/^open class PreferencesRow / { overrideInit = 1 }
/^open class PreferencesWindow / { overrideInit = 1 }
/^open class Window / { overrideInit = 1 }
/^    @inlinable public override init()/ {
	overrideInit = 0
}
/^    @inlinable public init()/ {
	if (overrideInit) {
		gsub("public", "override public")
		overrideInit = 0
	}
}
