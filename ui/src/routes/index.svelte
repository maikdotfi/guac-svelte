<h1>Welcome to SvelteKit</h1>
    {#if !connected}
    connecting...
    {/if}
    asdconnected
    <div bind:this={container} class="display" tabindex="0"/>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

<div class="container">
<template>
  <div class="viewport" ref="viewport">
    {#if !connected}
    connecting...
    {/if}
    <!-- tabindex allows for div to be focused -->
    <div bind:this={container} class="display" tabindex="0"/>
    <div id="display"/>
  </div>
</template>

<div id="display"/>
</div>


<script>
  import Guacamole from 'guacamole-common-js';
  import {onMount} from 'svelte';
  //import GuacMouse from '@/lib/GuacMouse'
  //import states from '@/lib/states'
  //import clipboard from '@/lib/clipboard'
  //import Modal from '@/components/Modal'

  //Guacamole.Mouse = GuacMouse.mouse

  const wsUrl = `ws://localhost:3000/websocket-tunnel`
  const httpUrl = `http://localhost:3000/tunnel`
  const query = `scheme=ssh&hostname=192.168.0.224&ignore-cert=true&username=mike&width=1024&height=768`
  let container;
  let connected = false;

  onMount(() => {
    var display = document.getElementById("display");
        //new Guacamole.WebSocketTunnel(wsUrl)
        // ws fails: Failed to execute 'send' on 'WebSocket': Still in CONNECTING state.
    var guac = new Guacamole.Client(
        new Guacamole.HTTPTunnel(httpUrl, true)
    );
    
    container.appendChild(guac.getDisplay().getElement());
    display.appendChild(guac.getDisplay().getElement());
    // TODO: resize the element returned and make sure z-index is not too low

    // Error handler
    guac.onerror = function(error) {
        alert(error);
    };

    // Connect
    guac.connect(query);
    guac.sendSize(600, 800)
    

    // Disconnect on close
    window.onunload = function() {
        guac.disconnect();
    }
  });

  function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
  }
  
  async function demo() {
      for (let i = 0; i < 2; i++) {
          console.log(`Waiting ${i} seconds...`);
          await sleep(i * 1000);
      }
      console.log('Done');
      connected = true;
  }
  
  demo();

  // Mouse
  //var mouse = new Guacamole.Mouse(guac.getDisplay().getElement());
        console.log(query);

  //mouse.onmousedown = 
  //mouse.onmouseup   =
  //mouse.onmousemove = function(mouseState) {
  //    guac.sendMouseState(mouseState);
  //};

  //// Keyboard
  //var keyboard = new Guacamole.Keyboard(document);

  //keyboard.onkeydown = function (keysym) {
  //    guac.sendKeyEvent(1, keysym);
  //};

  //keyboard.onkeyup = function (keysym) {
  //    guac.sendKeyEvent(0, keysym);
  //};
</script>

<!--
<style>
  .field {
      display: grid;
      grid-template-columns: 300px 1fr;
      margin-bottom: 1rem;
  }

  label {
      text-align: right;
  }

  label::after {
      content: ': '
  }

  input {
      margin-left: 1rem;
      margin-right: 1rem;
      font-size: 16pt;
      border: 1px solid black;
      border-radius: 2px;
      padding-left: 0.5rem;
  }

  .center {
      text-align: center;
  }

  .connect {
      font-size: 16pt;
      background: none;
      border: 1px solid black;
      border-radius: 5px;
      padding: .5rem 1rem;
  }

  .pl-1 {
      padding-left: 1rem;
  }
  html, body {
      margin: 0;
      height: 100%;
      width: 100%;
  }

  .container {
      width: 100%;
      height: 100%;
  }
</style>
-->
