# Swatches

Swatches is a color framework built on SASS.  Used well, it gives your application an amazing flexibility with respect to color choices.

## Basic Idea

You provide Swatches with a list of base colors.  For each base color, a color swatch of twenty shades and tints will be generated--from black all the way to white.  These tints and shades will be made available to your application as SASS variables.

For example, let's say that you had a color you want to call "red" that has the RGB values of (217, 83, 79).  Swatches will generate the following color variables for you:

    $red-0: #000000;
    $red-2: #080302;
    $red-4: #0f0505;
    $red-6: #170908;
    $red-8: #1e0b0b;
    $red-10: #260e0d;
    $red-12: #2d1110;
    $red-14: #341413;
    $red-16: #3c1716;
    $red-18: #441a18;
    $red-20: #4b1c1b;
    $red-22: #53201e;
    $red-24: #5a2220;
    $red-26: #622523;
    $red-28: #692826;
    $red-30: #702b29;
    $red-32: #782e2b;
    $red-34: #7f302e;
    $red-36: #873331;
    $red-38: #8e3633;
    $red-40: #963936;
    $red-42: #9d3c39;
    $red-44: #a43f3c;
    $red-46: #ac423e;
    $red-48: #b44541;
    $red-50: #bb4744;
    $red-52: #c34a47;
    $red-54: #ca4d49;
    $red-56: #d2504c;
    $red-58: #d9534f;
    $red-60: #db5c58;
    $red-62: #dc6460;
    $red-64: #de6b68;
    $red-66: #e07471;
    $red-68: #e27c79;
    $red-70: #e48582;
    $red-72: #e58c8a;
    $red-74: #e79492;
    $red-76: #e99d9b;
    $red-78: #eba5a3;
    $red-80: #edadab;
    $red-82: #eeb6b4;
    $red-84: #f0bdbc;
    $red-86: #f2c6c5;
    $red-88: #f4cecd;
    $red-90: #f6d6d5;
    $red-92: #f7dede;
    $red-94: #f9e6e6;
    $red-96: #fbefef;
    $red-98: #fdf7f7;
    $red-100: #ffffff;

If you use these variables in your SASS instead of directly hard-coding red values, then you could tweak your red hue to make it oranger by regenerating this "red" color using the RGB base color (217, 110, 79).  Swatches will update the SASS variables for you, and anywhere your app used these variables, the reds would now appear oranger.

Note the numbers in the names of the color variables.  They represent the value of the color, from 0 (black) to 100 (white).  Two unrelated colors with the same value number ($blue-25 and $orange-25, for example) should visually seem to have a similar darkness.

## Installing

Install the engine in your Gemfile like so:

    gem 'swatches', path: 'lib/swatches'

Create a config/swatches.rb file in your application that looks like this:

    Swatches.config.stylesheet_directory = 'app-layer/variables'

    Swatches.config.colors = [
        #--------COLOR NAME-----------RED-----GREEN--BLUE----#
        %w(      app-blue               0     118    169     ),
        %w(      app-sea-green         49     172    151     ),
        %w(      app-orange           227     115     65     ),
        %w(      app-plum             117      37     87     ),
        %w(      app-gray             119     120    123     ),
        %w(      sys-red              217      83     79     ),
        %w(      sys-yellow           250     190     70     ),
        %w(      sys-green             92     184     92     ),
      ]

config.colors is a list of named colors and their RGB values.  config.stylesheet_directory is the location where you want Swatches to put the generated color variables file.  It is a relative path that assumes you want to put the file somewhere in 'app/assets/stylesheets', so don't bother putting that part in your path.

Finally, add a route to config/routes.rb so that you can easily preview your color swatches:

    mount Swatches::Engine, :at => "/swatches",

## Using

Whenever you change the list of colors in config/swatches.rb, run the following rake task:

    rake swatches:generate

This will create a new _color-swatches.css.scss file and put it in the stylesheet directory named in config/swatches.rb.  Restart your web server for these new colors to take effect.

You can preview these generated colors by navigating to /swatches in your application.

## Contributors

Swatches was originally developed by [Wyatt Greene](/techiferous) and is maintained by [District Management Group][1].

[1]: https://dmgroupK12.com/
