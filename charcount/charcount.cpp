/* 	 This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <iostream>
#include <cstring>

using namespace std;


int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        cout << "Usage:" << endl;
        cout << "charcount [string ...]" << endl;
        return 255;
    }

    long length = 0;
                                 // For the spaces.
    for (long i = 1; i < argc; i++, length++)
    {
        for (int j = 0; argv[i][j]; j++)
        {
            length++;
        }
    }
    length--;

    cout << length << " caracters long." << endl;

    return 0;
}
