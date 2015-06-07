using Gtk;
using Cairo;

//FIXME [] int -> [] condition
enum condition
{
	missing,
	empty,
	my,
	first,
	second,
	third
}

delegate void DrawMethod();

void move_point(ref double x, ref double y, double angle, double size)
{
	angle = angle  / 180 * Math.PI;
	x = x + size * 2 * Math.cos(angle);
	y = y - size * 2  * Math.sin(angle);
}

void draw_hexagon_line(Context ctx, double centre_x, double centre_y, int number, int y)
{
	for(var x = 0; x < number; x++)
	{
		draw_hexagon(ctx, centre_x, centre_y, x, y);
		centre_x += size * 2;
	}
}

void draw_hexagon(Context ctx, double centre_x, double centre_y, int x, int y)
{
	ctx.save();
	select_color(ctx, x, y);
	ctx.new_path();
	ctx.move_to(centre_x, centre_y + size);
	ctx.rel_line_to(size * Math.cos(30.0 / 180 * Math.PI), -size * Math.sin(30.0 / 180 * Math.PI));
	ctx.rel_line_to(size * Math.cos(90.0 / 180 * Math.PI), -size * Math.sin(90.0 / 180 * Math.PI));
	ctx.rel_line_to(size * Math.cos(150.0 / 180 * Math.PI), -size * Math.sin(150.0 / 180 * Math.PI));
	ctx.rel_line_to(size * Math.cos(210.0 / 180 * Math.PI), -size * Math.sin(210.0 / 180 * Math.PI));
	ctx.rel_line_to(size * Math.cos(270.0 / 180 * Math.PI), -size * Math.sin(270.0 / 180 * Math.PI));
	ctx.close_path();
	ctx.fill();
	ctx.restore();
}

void select_color(Context ctx, int x, int y)
{
	var temp = Point(){x = x, y = y};
	if(selected && contain_point(temp, near) && field[temp.x, temp.y] == 1)
	{
		ctx.set_source_rgb(0xB3 / 255.0, 0xDC / 255.0, 0x70 / 255.0);
	}
	else if(field[x,y] == 0)
	{
		ctx.set_source_rgba(0x00 / 255.0, 0x00 / 255.0, 0x00 / 255.0, 0);
	}
	else if(field[x,y] == 1)
	{
		ctx.set_source_rgb(0x87 / 255.0, 0x87 / 255.0, 0x87 / 255.0);
	}
	else if(field[x,y] == 2)
	{
		ctx.set_source_rgb(0x92 / 255.0, 0xCD / 255.0, 0x32 / 255.0);
	}
	else if(field[x,y] == 3)
	{
		ctx.set_source_rgb(0x33 / 255.0, 0x99 / 255.0, 0xFF / 255.0);
	}
	else
	{
		ctx.set_source_rgb(0x00 / 255.0, 0x00 / 255.0, 0x00 / 255.0);
	}
}

bool contain_hexagon_point(double x_hexagon, double y_hexagon, double x, double y)
{
	/*Шестиугольник ограничен тремя парами линий.
	  Линии в паре параллельны, расстояние между ними одинаково.
	  Лучше всего это видно на бумажке :-)
	  Порядок проверки линйи линий - правая верхняя, правая, правая нижняя,
	  левая нижняя, левая, левая верхняя*/
	return Math.tan(150.0 / 180 * Math.PI) * (x - x_hexagon - size * Math.cos(30.0 / 180 * Math.PI)) >
	           -y + y_hexagon - size * Math.sin(30.0 / 180 * Math.PI) &&
	       x_hexagon + Math.cos(30.0 / 180 * Math.PI) * size > x &&
	       Math.tan(210.0 / 180 * Math.PI) * (x - x_hexagon - size * Math.cos(30.0 / 180 * Math.PI)) <
	           -y + y_hexagon + size * Math.sin(30.0 / 180 * Math.PI) &&
	           
	       Math.tan(150.0 / 180 * Math.PI) * (x - x_hexagon + size * Math.cos(30.0 / 180 * Math.PI)) <
	           -y + y_hexagon + size * Math.sin(30.0 / 180 * Math.PI) &&
	       x_hexagon - Math.cos(30.0 / 180 * Math.PI) * size < x &&
	       Math.tan(210.0 / 180 * Math.PI) * (x - x_hexagon + size * Math.cos(30.0 / 180 * Math.PI)) >
	           -y + y_hexagon - size * Math.sin(30.0 / 180 * Math.PI);
}

void new_line(int line_number, ref double x, ref double y, double size)
{
	if(line_number % 2 == 0)
	{
		move_point(ref x, ref y, 300.0, size);
	}
	else
	{
		move_point(ref x, ref y, 240.0, size);
	}
}

void find_hexagon_in_line(double x_start, double y_start, double x_point, double y_point,
                          out int x_array, out bool result)
{
	for(x_array = 0; x_array < field.length[0]; x_array++)
	{
		if(contain_hexagon_point(x_start, y_start, x_point, y_point))
		{
			result = true;
			return;
		}
		move_point(ref x_start, ref y_start, 0.0, size);
	}
	result = false;
}

void find_hexagon(double x_start, double y_start, double x_point, double y_point,
                          out int x_array, out int y_array, out bool result)
{
	for(y_array = 0; y_array < field.length[1]; y_array++)
	{
		find_hexagon_in_line(x_start, y_start, x_point, y_point, out x_array, out result);
		if(result)
		{
			return;
		}
		new_line(y_array, ref x_start, ref y_start, size);
	}
	result = false;
}

