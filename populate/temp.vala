using Gee;

int max_my;
int max_enemy;
ArrayList<Point?> all_cell;
int number_cell_player_make_move;

void find()
{
	max_my = 0;
	max_enemy = 0;
	all_cell = new ArrayList<Point?>();
	for_each_item(can);
	if(all_cell.size > 0)
	{
		capture(all_cell[Random.int_range(0, all_cell.size)], 3);
	}
}

void can(int x, int y)
{
	if(field[x, y] == 1)
	{
		var near = nearby_hex(x, y);
		var my = 0;
		var enemy = 0;
		for(var i = 0; i < near.size; i++)
		{
			if(field[near[i].x, near[i].y] == 2)
			{
				enemy++;
			}
			else if(field[near[i].x, near[i].y] == 3)
			{
				my++;
			}
		}
		if(my > 0)
		{
			//add_point_to_list(all_cell, Point(){x = x, y = y}, ref max, my + enemy);
			if(max_enemy == 0 && enemy > 0)
			{
				all_cell.clear();
				add_point_to_list(all_cell, Point(){x = x, y = y}, ref max_enemy, enemy);
			}
			else if(max_enemy == 0)
			{
				add_point_to_list(all_cell, Point(){x = x, y = y}, ref max_my, my);
			}
			else
			{
				add_point_to_list(all_cell, Point(){x = x, y = y}, ref max_enemy, enemy);
			}
		}
	}
}

void add_point_to_list(ArrayList<Point?> list, Point point, ref int max, int number)
{
	if(max < number)
	{
		list.clear();
		max = number;
		list.add(point);
	}
	else if(max == number)
	{
		list.add(point);
	}
}

bool can_player_make_move()
{
	for(var x = 0; x < field.length[0]; x++)
	{
		for(var y = 0; y < field.length[1]; y++)
		{
			if(field[x, y] == 2)
			{
				var near = nearby_hex(x, y);
				foreach(var cell in near)
				{
					if(field[cell.x, cell.y] == 1)
					{
						return true;
					}
				}
			}
		}
	}
	return false;
}



