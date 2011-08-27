#include <gtk/gtk.h>
#include <libxfce4panel/xfce-panel-plugin.h>
#include <unistd.h>

typedef enum
{
  // dir & 1 = LEFT or RIGHT
  // dir & 2 = TOP or BOTTOM
  TOP_LEFT = 0,
  TOP_RIGHT = 1,
  BOTTOM_LEFT = 2,
  BOTTOM_RIGHT = 3
}
CornerDir;

const int CORNER_DIR_COUNT = 4;

typedef struct {
  XfcePanelPlugin* plugin;
  // Core Data
  CornerDir corner_dir;
  // Widgets
  GtkWidget* eventbox;
  GtkWidget* drawing;
}
CornerImg;

static void cornerimg_construct (XfcePanelPlugin *plugin);
XFCE_PANEL_PLUGIN_REGISTER_EXTERNAL (cornerimg_construct);

static void gdk_color_to_doubles (GdkColor color, double* output)
{
  const int R=0, G=1, B=2;
  output[R] = color.red / 65535.0;
  output[G] = color.green / 65535.0;
  output[B] = color.blue / 65535.0;
}

static void drawing_update(CornerImg* cimg, cairo_t* cr)
{
  double width = cimg->drawing->allocation.width;
  double height = cimg->drawing->allocation.height;
  double pc[3];
  gdk_color_to_doubles(cimg->drawing->style->bg[GTK_STATE_NORMAL], pc);
  cairo_matrix_t matrix = {width, 0.0, 0.0, height, 0.0, 0.0};
  if (cimg->corner_dir & 1) // left or right?
  {
    matrix.x0 = width;
    matrix.xx *= -1;
  }
  if (cimg->corner_dir & 2)
  {
    matrix.y0 = height;
    matrix.yy *= -1;
  }

  cairo_set_matrix(cr, &matrix);
  cairo_set_antialias(cr, CAIRO_ANTIALIAS_GRAY);

  cairo_set_source_rgb(cr, pc[0], pc[1], pc[2]);
  cairo_rectangle(cr, 0.0, 0.0, 1.0, 1.0);
  cairo_fill(cr);

  cairo_move_to(cr, 1.0, 0.0);
  cairo_line_to(cr, 0.0, 0.0);
  cairo_line_to(cr, 0.0, 0.5);
  cairo_curve_to(cr, 0.0, 0.3, 0.2, 0.0, 1.0, 0.0);

  cairo_close_path(cr);
  cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
  cairo_fill(cr);
}

static gboolean drawing_on_expose(GtkWidget*       widget,
                                  GdkEventExpose*  event,
                                  gpointer         my_data)
{
  CornerImg* cimg = (CornerImg*) my_data;
  cairo_t* cr = gdk_cairo_create(widget->window);
  cairo_rectangle(cr,
                  event->area.x, event->area.y,
                  event->area.width, event->area.height);
  cairo_clip(cr);
  drawing_update(cimg, cr);
  cairo_destroy(cr);
  return FALSE;
}

void cornerimg_load_from_rc(CornerImg* cimg)
{
  char* file;
  if (!(file = xfce_panel_plugin_lookup_rc_file(cimg->plugin))) return;
  XfceRc* rc = xfce_rc_simple_open(file, TRUE);
  g_free(file);
  if (!rc) return;

  cimg->corner_dir = xfce_rc_read_int_entry(rc, "CornerDir", 0);

  xfce_rc_close (rc);
}

void cornerimg_write_rc(CornerImg* cimg)
{
  char* file;
  if (!(file = xfce_panel_plugin_save_location(cimg->plugin, TRUE))) return;
  unlink(file);
  XfceRc* rc = xfce_rc_simple_open(file, FALSE);
  g_free(file);
  if (!rc) return;

  xfce_rc_write_int_entry(rc, "CornerDir", cimg->corner_dir);

  xfce_rc_close (rc);
}

static void cornerimg_set_size(XfcePanelPlugin *plugin,
                               int size,
                               CornerImg* cimg)
{
  gtk_widget_set_size_request(GTK_WIDGET(plugin), size/2, size);
}

static void cornerimg_free_data(XfcePanelPlugin *plugin,
                               CornerImg* cimg)
{
  panel_slice_free(CornerImg, cimg);
}

static gboolean cornerimg_toggle_dir(GtkWidget* widget, GdkEventButton* event,
                                     CornerImg* cimg)
{
  if (event->button == 1)
  {
    cimg->corner_dir ++;
    if (cimg->corner_dir >= CORNER_DIR_COUNT)
      cimg->corner_dir = 0;
    cairo_t* cr = gdk_cairo_create (cimg->drawing->window);
    drawing_update(cimg, cr);
    cairo_destroy (cr);
    cornerimg_write_rc(cimg);
  }
  return FALSE;
}

static void cornerimg_construct(XfcePanelPlugin* plugin)
{
  CornerImg *cimg = panel_slice_new0 (CornerImg);
  cimg->plugin = plugin;
  cornerimg_load_from_rc(cimg);

  gtk_container_set_border_width(GTK_CONTAINER(plugin), 0);

  cimg->eventbox = gtk_event_box_new();
  gtk_container_add(GTK_CONTAINER(plugin), cimg->eventbox);
  g_signal_connect(cimg->eventbox, "button-press-event",
                   G_CALLBACK(cornerimg_toggle_dir), cimg);

  cimg->drawing = gtk_drawing_area_new();
  g_signal_connect (cimg->drawing, "expose-event",
                    G_CALLBACK (drawing_on_expose), cimg);
  gtk_container_add(GTK_CONTAINER(cimg->eventbox), cimg->drawing);

  g_signal_connect(plugin, "size-changed",
                   G_CALLBACK(cornerimg_set_size), NULL);
  g_signal_connect(plugin, "free-data",
                   G_CALLBACK (cornerimg_free_data), cimg);

  gtk_widget_show_all(cimg->eventbox);

  xfce_panel_plugin_add_action_widget (plugin, GTK_WIDGET(cimg->eventbox));
  cornerimg_set_size(plugin, xfce_panel_plugin_get_size(plugin), cimg);
}
