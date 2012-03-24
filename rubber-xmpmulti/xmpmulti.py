# This file is part of Rubber and thus covered by the GPL
# (c) Jérémie Detrey, 2009
"""
Support for the package 'xmpmulti', part of Beamer distribution.
"""

from os.path import basename
import rubber
from rubber import _
from rubber import *

class Module (rubber.rules.latex.Module):
	def __init__ (self, doc, dict):
		self.doc = doc
		self.env = doc.env
		if doc.modules.has_key("graphics"):
			self.graphics = doc.modules["graphics"]
		elif doc.modules.has_key("graphicx"):
			self.graphics = doc.modules["graphicx"]
		else:
			msg.error(_("package 'xmpmulti' requires 'graphics' or 'graphicx'"))
			sys.exit(2)
		doc.add_hook("multiinclude", self.multiinclude)

	def multiinclude (self, dict):
		if not dict["arg"]:
			return 0
		msg.log(_("requesting multi-layer graphics `%s'...") % dict["arg"], pkg="xmpmulti")
		if dict.has_key("optb") and dict["optb"]:
			dict["opt"] = dict["optb"]
		suffix = ".0";
		if dict.has_key("opt") and dict["opt"]:
			opts = parse_keyval(dict["opt"])
			if opts.has_key("format") and opts["format"]:
				suffix = "-0." + opts["format"]
		dict["arg"] += suffix
		return self.graphics.includegraphics(dict)
