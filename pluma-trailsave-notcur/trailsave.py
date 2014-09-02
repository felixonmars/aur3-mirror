# Copyright (c) 2014, <daggerbot@gmail.com>

import pluma

class TrailSavePlugin (pluma.Plugin):
  def __init__ (self):
    pluma.Plugin.__init__(self)
    self._tab_added_handlers = {}
    self._tab_removed_handlers = {}
    self._save_handlers = {}

  def activate (self, window):
    self._tab_added_handlers[window] = window.connect('tab_added', self.on_tab_added)
    self._tab_removed_handlers[window] = window.connect('tab_removed', self.on_tab_removed)
    for doc in window.get_documents():
      self._save_handlers[doc] = doc.connect('save', self.on_save)

  def deactivate (self, window):
    window.disconnect(self._tab_added_handlers[window])
    window.disconnect(self._tab_removed_handlers[window])
    del self._tab_added_handlers[window]
    del self._tab_removed_handlers[window]
    for doc in window.get_documents():
      doc.disconnect(self._save_handlers[doc])
      del self._save_handlers[doc]

  def on_save (self, doc, uri, encoding, flags):
    cur_line  = doc.get_iter_at_offset(doc.get_property('cursor-position')).get_line()
    num_lines = doc.get_line_count()

    for lineno in range(0, num_lines):
      begin = doc.get_iter_at_line(lineno)
      if lineno == num_lines - 1:
        end = doc.get_end_iter()
      else:
        end = doc.get_iter_at_line(lineno + 1)
      line          = doc.get_text(begin, end)
      stripped_line = line.rstrip()

      begin = doc.get_iter_at_line_index(lineno, len(stripped_line))
      if line[-2:] == '\r\n':
        end = doc.get_iter_at_line_index(lineno, len(line) - 2)
      elif line[-1:] == '\n' or line[-1:] == '\r':
        end = doc.get_iter_at_line_index(lineno, len(line) - 1)
      else:
        end = doc.get_iter_at_line_index(lineno, len(line))

      if lineno != cur_line:
        doc.delete(begin, end)

  def on_tab_added (self, window, tab):
    doc = tab.get_document()
    self._save_handlers[doc] = doc.connect('save', self.on_save)

  def on_tab_removed (self, window, tab):
    doc = tab.get_document()
    doc.disconnect(self._save_handlers[doc])
    del self._save_handlers[doc]
