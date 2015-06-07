using Gee;
using Gtk;
using Cairo;

PopulateGame cairo_sample;
double x_center_first;
double y_center_first;
double size;
//FIXME надо переименовать
public int[,] field;
Point point;
ArrayList<Point?> near;
bool selected;
bool can_bot_make_move;
int wait;

public class PopulateGame : Gtk.Window
{
	public PopulateGame()
	{
		this.title = "Populate game";
		this.destroy.connect(exit);
		set_default_size(400, 500);
		var drawing_area = new DrawingArea();
		drawing_area.draw.connect(on_draw);
		add(drawing_area);
		button_press_event.connect(temp);
		x_center_first = 20;
		y_center_first = 30;
		size = 24;
		create_field();
		near = new ArrayList<Point?>();
	}
	
	private void create_field()
	{
		field = new int[8,10];
		field[0, 3] = 3;
		field[1, 1] = 1;
		field[1, 2] = 3;
		field[1, 3] = 1;
		field[1, 4] = 3;
		field[1, 5] = 1;
		field[2, 0] = 1;
		field[2, 1] = 1;
		field[2, 2] = 1;
		field[2, 3] = 1;
		field[2, 4] = 3;
		field[2, 5] = 1;
		field[2, 6] = 1;
		field[3, 0] = 1;
		field[3, 1] = 1;
		field[3, 2] = 1;
		field[3, 3] = 1;
		field[3, 4] = 1;
		field[3, 5] = 1;
		field[3, 6] = 1;
		field[4, 0] = 1;
		field[4, 1] = 1;
		field[4, 2] = 1;
		field[4, 3] = 1;
		field[4, 4] = 1;
		field[4, 5] = 1;
		field[4, 6] = 1;
		field[5, 0] = 1;
		field[5, 1] = 1;
		field[5, 2] = 1;
		field[5, 3] = 1;
		field[5, 4] = 2;
		field[5, 5] = 1;
		field[5, 6] = 1;
		field[6, 2] = 1;
		field[6, 3] = 1;
		field[6, 4] = 1;
	}
	
	private void exit()
	{
		Gtk.main_quit();
	}
	
	private bool temp(Gdk.EventButton event)
	{
		int x;
		int y;
		bool result;
		const int val = 2;
		find_hexagon(x_center_first, y_center_first, event.x, event.y,
		             out x, out y, out result);
		if(result)
		{
			if(event.button == 1)
			{
				if(field[x, y] == 2)
				{
					point.x = x;
					point.y = y;
					selected = true;
					near = nearby_hex(point.x, point.y);
				}
				else if(contain_point(Point(){x = x, y = y}, near) && field[x, y] == 1)
				{
					capture(Point(){x = x, y = y}, 2);
					can_bot_make_move = true;
					selected = false;
					near.clear();
				}
				else
				{
					selected = false;
					near.clear();
				}
			}
			//FIXME код для отладки
			else if(event.button == 2)
			{
				if(field[x, y] == 3)
				{
					field[x, y] = 1;
				}
				else if(field[x, y] == 1)
				{
					field[x, y] = 2;
				}
				else if(field[x, y] == 2)
				{
					field[x, y] = 3;
				}
			}
			else if(event.button == 3)
			{
				find();
			}
		}
		return true;
	}
	
	private bool on_draw(Widget da, Context ctx)
	{
		
		ctx.set_source_rgb(0, 0, 0);
		var x = x_center_first;
		var y = y_center_first;
		//FIXME m не очень хорошее имя
		for(var m = 0; m < field.length[1]; m++)
		{
			draw_hexagon_line(ctx, x, y, field.length[0], m);
			new_line(m, ref x, ref y, size);
		}
		if(can_bot_make_move)
		{
			can_bot_make_move = false;
			find();
			if(!can_player_make_move() && can_make_move())
			{
				wait = 3;
			}
		}
		else if(!can_make_move())
			{
				draw_text(ctx, how_win());
			}
		if(wait > 0)
		{
			wait--;
			if(wait == 0)
			{
				can_bot_make_move = true;
			}
		}
		return true;
	}
	
	public void draw_text(Context ctx, string utf8)
	{
		ctx.select_font_face ("Sans", Cairo.FontSlant.NORMAL, Cairo.FontWeight.NORMAL);
		ctx.set_font_size (52.0);
		Cairo.TextExtents extents;
		ctx.text_extents (utf8, out extents);
		double x = 200.0-(extents.width/2 + extents.x_bearing);
		double y = 250.0-(extents.height/2 + extents.y_bearing);
		ctx.move_to (x, y);
		ctx.show_text (utf8);
	}
}

int main(string[] args)
{
	Gtk.init(ref args);
	cairo_sample = new PopulateGame();
	cairo_sample.show_all();
	Timeout.add(17,()=>{cairo_sample.queue_draw();return true;});
	Gtk.main();
	return 0;
}



