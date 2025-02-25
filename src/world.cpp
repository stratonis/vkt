#include "globaldef.h"
#include "veng.h"
#include "player.h"
#include "cursor.h"
#include "render.h"
#include "ivec.h"
#include "entity.h"
#include "config.h"

float lastTime, deltaTime;
unsigned long  framecount;
float gameTime = 0.0f;

int main()
{ 
  // The order matters! Do not touch!
  config_init();
  render_init(); 
  player_init();
  veng_init  ();
 
  while(!glfwWindowShouldClose(window))
  {
    float time = glfwGetTime();
    deltaTime = time - lastTime;
    lastTime  = time;
    
    player_tick();
    render_tick();
    veng_tick  ();
    framecount++;
    gameTime += deltaTime;
  }

  player_terminate();
  veng_terminate  ();
  render_terminate();
  return 0;
}
