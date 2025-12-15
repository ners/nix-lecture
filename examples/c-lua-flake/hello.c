#include <stdio.h>
#include <lualib.h>
#include <lauxlib.h>

const char* s = "print('Hello from Lua!')";

int main() {
  lua_State* L = luaL_newstate();
  luaL_openlibs(L);
  luaL_dostring(L, s);
  lua_close(L);
}
