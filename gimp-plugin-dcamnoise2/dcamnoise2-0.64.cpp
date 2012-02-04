/*
 * Copyright (C) 2005 Peter Heckert
 *                    <peter /dot/ heckert /at/ arcor /dot/ de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

/*
 * =========Version History=============
 * Version 0.64 24.Apr. 2006
 * Started major rewrite.
 * Move to c++.
 * Removed IIR filter,implemented FIR filter
 * Better sharpness, easier to adjust.
 *
 *
 */


#define STANDALONE


#ifndef STANDALONE
#include "config.h"
#endif


#include <stdlib.h>
#include <string.h>
#include <stdio.h>



#include <gtk/gtk.h>

#include <libgimp/gimp.h>
#include <libgimp/gimpui.h>

#ifdef STANDALONE

#define INIT_I18N voidproc
void voidproc(void){};
#define _(x) (x)
#define N_(x)  (x)

#else

#include "libgimp/stdplugins-intl.h"

#endif


#define PLUG_IN_VERSION "0.64"

#define SCALE_WIDTH   150
#define ENTRY_WIDTH     4

// This is for testing only!
//#define float double
//#define gfloat gdouble

/* Uncomment this line to get a rough estimate of how long the plug-in
 * takes to run.
 */

/*  #define TIMER  */


typedef struct
{
  gdouble  radius;
  gdouble  lsmooth;
  gdouble  csmooth;
  gdouble  effect;
  gdouble  lookahead;
  gdouble  gamma;
  gdouble  damping;
  gdouble phase;
  gdouble texture;
  gdouble sharp;
  gboolean update_preview;

}
UnsharpMaskParams;

typedef struct
{
  gboolean  run;
}
UnsharpMaskInterface;

/* local function prototypes */
static void      query (void);
static void      run   (const gchar      *name,
                        gint              nparams,
                        const GimpParam  *param,
                        gint             *nreturn_vals,
                        GimpParam       **return_vals);

static void      blur_line           (gfloat  * const data,
                                      gfloat  * const data2,
                                      gfloat  * const buffer,
                                      gfloat *rbuf,
                                      gfloat *tbuf,
                                      const guchar   *src,
                                      guchar         *dest,
                                      gint            len,
                                      glong           bytes);

static void      unsharp_region      (GimpPixelRgn   *srcPTR,
                                      GimpPixelRgn   *dstPTR,
                                      gint            bytes,
                                      gdouble         radius,
                                      gdouble         lsmooth,
                                      gint            x1,
                                      gint            x2,
                                      gint            y1,
                                      gint            y2,
                                      gboolean        show_progress);

static void      noise_filter        (GimpDrawable   *drawable,
                                      gdouble         radius,
                                      gdouble         lsmooth);

static gboolean  unsharp_mask_dialog (GimpDrawable   *drawable);
static void      preview_update      (GimpPreview    *preview);


/* create a few globals, set default values */
static UnsharpMaskParams unsharp_params =
  {
    5.0, /* default radius = 5 */
    1.0, /* Luminance Tolerance */
    1.0, /* RGB Tolerance  */
    0.13, /* Adaptive filter-effect threshold */
    2.0, /* Lookahead */
    1.4, /* Filter gamma */
    5.0,  /* Phase jitter Damping  */
    2.0,  /* Edge Erosion */
    0.0,  /* Texture Detail */
    0.25,  /* Sharpness factor */
    TRUE /* default is to update the preview */
    /* These values are values that I used for a test image with some success.
       They are not optimal for every image*/

  };

/* Setting PLUG_IN_INFO */
GimpPlugInInfo PLUG_IN_INFO =
  {
    NULL,  /* init_proc  */
    NULL,  /* quit_proc  */
    query, /* query_proc */
    run,   /* run_proc   */
  };



static inline gdouble bsq(gdouble val)
{
  return fabs(val) * val;
}


static inline gdouble sq(gdouble val)
{
  return val*val;
}

class class_Gauss
{
  public:
   void init(float val){
     for(int i=0;i<257;i++) curve[i+1] = exp(-sq((float)i)/(2.0*val*val));
    curve[0]=curve[2];
  }
  
  inline float g(float val)
  {
    const float * const lut = curve+1;
    
    val = fabs(val);
    if (val >= 1.0) return 0.0;

    const int idx = lrint (val*255.0);
    const float xv = (val-(float) idx/255.0)/255.0;
    const float yenv = (lut[idx-1] + lut[idx+1])/2.0;
    const float y0=lut[idx];

  //calculate result using stirlings interpolation
    return (y0 + (((yenv) +(yenv-y0)*0.5)*xv)*xv);
  }
  private:
    float curve[258];
};

class_Gauss gausst,gausst2;

class Lut
{
public:
  inline float g(float val){return _gamma(val,lut+1);}
  inline float g_inv(float val){return _gamma(val,inv_lut+1);}
  void  init(float);
private:
  float _gamma(float, float const * const);
  float lut[258];
  float inv_lut[258];
};



void Lut::init(float val)
{
  for (int i=0; i<=257; i++)
  {
    lut[i+1] = pow((float) i/255.0,val);
    inv_lut[i+1] = pow((float) i/255.0,1.0/val);
  }
  lut[0] = -lut[2];
  inv_lut[0] = -inv_lut[2];

}

float Lut::_gamma(float val, float const * const lut)
{
  const float s = (val < 0.0 ? -1.0:1.0);
  val = fabs(val);
  if (val >= 1.0) return s;

  const int idx = lrint (val*255.0);
  const float xv = 0.5*(val-(float) idx/255.0)/255.0;
  const float yenv = (lut[idx-1] + lut[idx+1]);
  const float y0=lut[idx];

  //calculate result using stirlings interpolation
  return (y0 + (yenv-(yenv-y0-y0)*xv)*xv)*s;
}

Lut image_gamma,texture_gamma;

MAIN ()

static void query (void)
{
  static GimpParamDef args[] =
    {
      { GIMP_PDB_INT32,    "run_mode",  "Interactive, non-interactive" },
      { GIMP_PDB_IMAGE,    "image",     "(unused)" },
      { GIMP_PDB_DRAWABLE, "drawable",  "Drawable to draw on" },
      { GIMP_PDB_FLOAT,    "radius",    "Radius of gaussian blur (in pixels)" },
      { GIMP_PDB_FLOAT,    "lsmooth",    "Luminance Tolerance" },
      { GIMP_PDB_FLOAT,    "csmooth", "Color Tolerance" },
      { GIMP_PDB_FLOAT,    "effect", "Threshold for 2nd derivative of luminance" },
      { GIMP_PDB_FLOAT,    "lookahead", "Sharpness" } ,

      { GIMP_PDB_FLOAT,    "gamma", "Gamma" } ,

      { GIMP_PDB_FLOAT,    "damping", "Phase jitter damping" },
      { GIMP_PDB_FLOAT,    "phase", "Phase shift for edges" },
      { GIMP_PDB_FLOAT,    "texture", "Texture accuracy" },
      { GIMP_PDB_FLOAT,    "sharp", "Edge accuracy" }


    };

  gimp_install_procedure ("plug_in_dcamnoise2-"PLUG_IN_VERSION,
                          "A Digital Camera Noise filter",
                          "It is commonly "
                          "used on photographic images, and is provides a much "
                          "more pleasing result than the standard denoising "
                          "filters.",

                          "This is an experimental version. ",
                          "",
                          "",


                          N_("_Dcam Noise 2 "PLUG_IN_VERSION" ..."),
                          "GRAY*, RGB*",
                          GIMP_PLUGIN,
                          G_N_ELEMENTS (args), 0,
                          args, NULL);

  gimp_plugin_menu_register ("plug_in_dcamnoise2-"PLUG_IN_VERSION,
                             "<Image>/Filters/Enhance");
}

static void
run (const gchar      *name,
     gint              nparams,
     const GimpParam  *param,
     gint             *nreturn_vals,
     GimpParam       **return_vals)
{
  static GimpParam   values[1];
  GimpPDBStatusType  status = GIMP_PDB_SUCCESS;
  GimpDrawable      *drawable;
  GimpRunMode        run_mode;
#ifdef TIMER
  GTimer            *timer = g_timer_new ();
#endif

  run_mode = (GimpRunMode) param[0].data.d_int32;

  *return_vals  = values;
  *nreturn_vals = 1;

  values[0].type          = GIMP_PDB_STATUS;
  values[0].data.d_status = status;

  INIT_I18N ();

  /*
   * Get drawable information...
   */
  drawable = gimp_drawable_get (param[2].data.d_drawable);
  gimp_tile_cache_ntiles (2 * (drawable->width / gimp_tile_width () + 1));

  switch (run_mode)
  {
  case GIMP_RUN_INTERACTIVE:
    gimp_get_data ("plug_in_dcamnoise2-"PLUG_IN_VERSION, &unsharp_params);
    /* Reset default values show preview unmodified */

    /* initialize pixel regions and buffer */
    if (! unsharp_mask_dialog (drawable))
      return;

    break;

  case GIMP_RUN_NONINTERACTIVE:
    if (nparams != 13)
    {
      status = GIMP_PDB_CALLING_ERROR;
    }
    else
    {
      unsharp_params.radius = param[3].data.d_float;
      unsharp_params.lsmooth = param[4].data.d_float;
      unsharp_params.csmooth = param[5].data.d_float;
      unsharp_params.effect = param[6].data.d_float;
      unsharp_params.lookahead = param[7].data.d_float;
      unsharp_params.gamma = param[8].data.d_float;
      unsharp_params.damping = param[9].data.d_float;
      unsharp_params.phase = param[10].data.d_float;
      unsharp_params.texture = param[11].data.d_float;
      unsharp_params.sharp = param[12].data.d_float;

      /* make sure there are legal values */
      if ((unsharp_params.radius < 0.0) ||
          (unsharp_params.lsmooth < 0.0))
        status = GIMP_PDB_CALLING_ERROR;
    }
    break;

  case GIMP_RUN_WITH_LAST_VALS:
    gimp_get_data ("plug_in_dcamnoise2-"PLUG_IN_VERSION, &unsharp_params);
    break;

  default:
    break;
  }

  if (status == GIMP_PDB_SUCCESS)
  {
    drawable = gimp_drawable_get (param[2].data.d_drawable);

    /* here we go */
    noise_filter (drawable, unsharp_params.radius, unsharp_params.lsmooth);

    gimp_displays_flush ();

    /* set data for next use of filter */
    gimp_set_data ("plug_in_dcamnoise2-"PLUG_IN_VERSION, &unsharp_params,
                   sizeof (UnsharpMaskParams));

    gimp_drawable_detach(drawable);
    values[0].data.d_status = status;
  }

#ifdef TIMER
  g_printerr ("%f seconds\n", g_timer_elapsed (timer, NULL));
  g_timer_destroy (timer);
#endif
}

static inline gdouble bsqrt(gdouble val)
{
  if (val >= 0.0) return sqrt(val);
  else return -sqrt(-val);
}

static inline gdouble mypow( gdouble val,gdouble ex)
{
  //TODO: The mypow function needs 50% of runtime.
  // Develop faster approximation method for speedup.
  // No need for more accuracy as 10% here, however
  // the approximation mut be smooth and the inverse
  // must be accurate
  // e.g. mypow(mypow(x,1/y),y) must give 1.0 with at least 0.1 % accuracy

  if (fabs(val) < 1e-16) return 0;
  if (val > 0.0) return exp2(log2(val)*ex);
  return -exp2(log2(-val)*ex);
}


#if 0
static void box_filter(float *src, float *end, float * dest, float radius)
/* src and dest must be different */
{
  gfloat fbw = 2.0 * radius;
  if (fbw < 1.0) fbw = 1.0;
  gfloat box = (*src);

  gint boxwidth=1;

  while(boxwidth+2 <= (int) fbw) boxwidth+=2, box += (src[boxwidth/2]) + (src[-boxwidth/2]);
  gdouble frac = (fbw - (gdouble) boxwidth)/2.0;
  gint  bh = boxwidth/2, bh1 =boxwidth/2+1;


  for ( ; src <= end; src++, dest++)
  {

    *dest = (box + frac * ((src[bh1])+(src[-bh1])))/fbw;
    box = box - (src[-bh]) + (src[bh1]);

  }

}
#endif

static float *scratch;


static void fir_filter(float * const start,
                       float * const end,
                       float * dstart,
                       float radius,
                       const gint type)
{
  if (!dstart) dstart = start;
  gfloat *src = start;
  gfloat *dest = dstart;
  gfloat *dend = dstart + (end - start);
  gfloat gain;

  if (type == 2)
    memcpy(scratch,start,sizeof(*start)*(end-start));

  {
    const float boxwidth = radius *2.0;
    const int intboxwidth = (int) boxwidth;
    const float fracboxwidth = boxwidth-(float) intboxwidth;
    const int tail=intboxwidth+1;
    float box = *src;
    //forward pass 1
    for (int i = 0; i < intboxwidth;i++)
      box += *(++src);

    dest += intboxwidth;
    while (++src <=end )
    {
      box = box - src[-tail]+src[0];
      (++dest)[-tail] = box +src[-tail]*fracboxwidth;
    }
    for (dest -= tail,src -= tail; src <= end; src++,dest++)
      *dest = *src * boxwidth;

    // backward pass 1
    box = *(--dest);
    for (int i = 0; i < intboxwidth;i++)
      box += *(--dest);

    while (--dest >= dstart )
    {
      box = box - dest[tail]+dest[0];
      dest[tail] = box + dest[tail]*fracboxwidth;
    }
    for (dest += tail; dest >= dstart;dest--)
      *dest *= boxwidth;

    gain= sq(1.0+boxwidth);
  }

  {
    const float boxwidth = radius*1.5;
    const int intboxwidth = (int) boxwidth;
    const float fracboxwidth = boxwidth-(float) intboxwidth;
    const int tail=intboxwidth+1;
    float box = 0.0;
    gain *= sq(1.0+boxwidth);
    const float gaincompensation = 1.0/gain;

    // forward pass 2
    box = *(++dest);
    for (int i = 0; i < intboxwidth;i++)
      box += *(++dest);

    while (++dest <= dend )
    {
      box = box - dest[-tail]+dest[0];
      dest[-tail] = box + dest[-tail]*fracboxwidth;
    }
    for (dest -= tail; dest <= dend;dest++)
      *dest *= boxwidth;

    //backward pass 2
    box = *(--dest);
    for (int i = 0; i < intboxwidth;i++)
      box += *(--dest);

    while (--dest >= dstart )
    {
      box = box - dest[tail]+dest[0];
      dest[tail] = (box + dest[tail]*fracboxwidth)*gaincompensation;
    }
    for (dest += tail; dest >= dstart;dest--)
      *dest *= boxwidth;

    switch(type)
    {
    case 0: break;
    case 1: break;
      // Unsharp-Mask type highpassfilter
    case 2:
      src= scratch;
      dest = dstart;
      for ( ;dest<=dend;dest++,src++)
      {
        *dest = fabs(*dest - *src);
      }
      break;

#if 0
      //2nd derivative
    case 2:
      gint ofs = (int) radius;
      if (ofs < 1) ofs=1;

      dest += ofs+1;
      while (++dest <= dend)
        dest[-ofs] -= *dest;

      dest -= ofs-1;
      while (--dest >= dstart)
        dest[ofs] = fabs(dest[ofs]-*dest);

      break;
#endif

    }

  }
}




//define FR 0.3
//define FG 0.59
//#define FB 0.11

#define FR 0.212671
#define FG 0.715160
#define FB 0.072169



static void filter(gfloat *buffer, gfloat *data, gfloat *data2, gfloat *rbuf, gfloat *tbuf, gint width, gint color)
/*
 * A  forward-backward box filter is used here and the radius is adapted to luminance jump.
 * Radius is calculated from 2nd derivative of intensity values.
 * (Its not exactly 2nd derivative, but something similar, optimized by experiment) 
 * The radius variations are filtered. This reduces spatial phase jitter. 
 *
 */

{
  gfloat *lp = data, *rp = data + width-1;
  gfloat *lp2 = data2;
  gfloat *blp = buffer, *brp = buffer + width-1;
  gfloat *rbuflp = rbuf, *rbufrp = rbuf + width-1;
  gfloat *p1,*p2;
  gfloat fboxwidth = unsharp_params.radius*2.0;
  gfloat fradius = unsharp_params.radius;
  if (fboxwidth < 1.0) fboxwidth = 1.0 ;
  if (fradius < 0.5) fradius = 0.5;
  gint i;
  gint ofs,ofs2;
  gfloat maxrad;
  gfloat fbw;
  gfloat val;
  gdouble rfact = sq(unsharp_params.effect);
  gdouble sharp=unsharp_params.sharp;
  ofs2 = (int) floor(unsharp_params.damping*2.0+0.1);


  ofs = (int) floor(unsharp_params.lookahead*2.0+0.1);
  gint pass,w=(int) (fboxwidth*2+unsharp_params.damping+unsharp_params.lookahead+unsharp_params.phase + 2.0);



  for (i=1; i <= w; i++) blp[-i]=blp[i]; /* Mirror image edges */
  for (i=1; i <= w; i++) brp[i] = brp[-i];

  if (color < 0)
  {

    /* Calc 2nd derivative */

    for (p1 = blp,p2=rbuflp;p1<= brp;p1++,p2++)
    { /* boost high frequency in rbuf */
      *p2 = (sharp+1.0) * p1[0] - sharp * 0.5 * (p1[-ofs]+p1[ofs]);
    }
    fir_filter(rbuflp-w,rbufrp+w,blp-w,unsharp_params.lookahead,2);
    for (i=1; i <= w; i++) blp[-i]=blp[i]; /* Mirror image edges */
    for (i=1; i <= w; i++) brp[i] = brp[-i];

    //    for (p1 = blp,p2=rbuflp;p1<= brp;p1++,p2++)
    //    { /* boost high frequency in rbuf */
    //        *p2 = ((sharp+1.0) * (p1[0]) - sharp * 0.5 * ((p1[-ofs])+(p1[ofs])));
    //    }
    memcpy(rbuflp,blp,(brp-blp)*sizeof(*blp));

    for (i=1; i <= w; i++) rbuflp[-i]=rbuflp[i]; /* Mirror rbuf edges */
    for (i=1; i <= w; i++) rbufrp[i] = rbufrp[-i];

    /* Lowpass (gauss) filter rbuf, remove phase jitter */
    fir_filter(rbuflp-w+5,rbufrp+w-5,rbuflp-w+5,unsharp_params.damping,0);

    for (i=-w+5; i< width-1+w-5;i++)
    {
      //      val = rbuflp[i];
      val = rbuflp[i]-rfact;
      if (val < rfact/fradius) val=rfact/fradius; /* Avoid division by zero, clip negative filter overshoot */
      val = rfact/val;
      // val = mypow(val/fradius,unsharp_params.phase)*fradius;
      if (val < 0.5) val = 0.5;

      rbuflp[i] = val*2.0;
    }

    for (i=1; i <= w; i++) rbuflp[-i]=rbuflp[i]; /* Mirror rbuf edges */
    for (i=1; i <= w; i++) rbufrp[i] = rbufrp[-i];
    return;
  } /* if color < 0 */



  /* Calc lowpass filtered input signal */
  fir_filter(blp-w+1,brp+w-1,lp2-w+1,unsharp_params.radius,0);


  /* Subtract low frequency from input signal (aka original image data)
   * and predistort this signal
   */
  val = unsharp_params.texture+1.0;
  for (i = -w+1;i <= width-1+w-1;i++)
  {
    blp[i] = texture_gamma.g(blp[i]- lp2[i]);
  }


  gfloat *src, *dest;
  val = unsharp_params.texture+1.0;

  pass = 2;

  while (pass--)
  {

    gint ibw;
    src = blp;
    dest =lp;
    gfloat sum;

    maxrad = 0.0;

    for (i=1; i <= w; i++) src[-i]=src[i]; /* Mirror left edge */

    sum =  (src[-1] += src[-2]);

    /* forward pass */
    for (rbuf = rbuflp - (int) unsharp_params.phase; rbuf <= rbufrp; src++, dest++, rbuf++)
    {

      //fbw = fabs( rbuf[-ofs2]*ll2+rbuf[-ofs2-1]*rl2);
      fbw = *rbuf;

      if (fbw > (maxrad += 1.0)) fbw = maxrad;
      else if (fbw < maxrad) maxrad = fbw;
      ibw = (gint) fbw;

      *src = sum += *src;
      *dest = (sum-src[-ibw]+(src[-ibw]-src[-ibw-1])*(fbw-ibw))/fbw;
    }



    src = rp;
    dest = brp;

    maxrad = 0.0;

    for (i=1; i <= w; i++) src[i] = src[-i];  /* Mirror right edge */

    sum =   (src[1] += src[2]);
    /* backward pass */
    for ( rbuf = rbufrp  + (int) unsharp_params.phase; rbuf >= rbuflp; src--, dest--, rbuf--)
    {

      //fbw = fabs( rbuf[ofs2]*ll2+rbuf[ofs2+1]*rl2);
      fbw = *rbuf;

      if (fbw > (maxrad +=1.0)) fbw = maxrad;
      else if (fbw < maxrad) maxrad = fbw;

      ibw = (gint) fbw;

      *src = sum += *src;
      *dest = (sum-src[ibw]+(src[ibw]-src[ibw+1])*(fbw-ibw))/fbw;

    }


  } /* Next pass */


  for (i = -w+1;i <= width-1+w-1;i++)
  {
    /* Undo  predistortion */

    blp[i]= texture_gamma.g_inv(blp[i]);
    blp[i] += lp2[i]; /* Add in low frequency */

    //      if (blp[i] >= 0.0) blp[i] = mypow(blp[i],val);
    //      else blp[i] = 0.0;

  }

}

/* This function is written as if it is blurring a column at a time,
 * even though it can operate on rows, too.  There is no difference
 * in the processing of the lines, at least to the blur_line function.
 */
static void
blur_line (gfloat * const data,
           gfloat * const data2,
           gfloat * const buffer,
           gfloat * rbuf,
           gfloat * tbuf,
           const guchar  *src,
           guchar        *dest,
           gint           len,   /* length of src and dest */
           glong          bytes) /* Bits per plane */
{
  gint    b;
  gint    row;
  gint colors = 3;
  if (bytes < 3) colors = 1;

  gint idx;
  /* Calculate radius factors */
  if (colors < 3)
  {
    for (row =0, idx=0 ; idx < len; row +=bytes, idx++) data[idx] = image_gamma.g((float) dest[row]/255.0);
    filter(data, data2, buffer,rbuf,tbuf, len, -1);
  }
  else
  {
    for (row =0, idx=0 ; idx < len; row +=bytes, idx++)
    {
      /* Color weigths are choosen proportional to Bayer Sensor pixel count */
      data[idx] = (gfloat) dest[row] / 255.0 * 0.25; /* Red color */
      data[idx] +=  (gfloat) dest[row+1] / 255.0 * 0.5; /* Green color */
      data[idx] +=  (gfloat) dest[row+2] / 255.0 * 0.25;  /* Blue color */
      data[idx] = image_gamma.g(data[idx]);
    }
    filter(data, data2, buffer,rbuf,tbuf, len, -1);
  }

  /* Do actual filtering */
  for (b = 0; b<colors; b++)
  {
    for (row =b, idx=0 ; idx < len; row +=bytes, idx++) data[idx] =  image_gamma.g(src[row]/255.0);

    filter(data, data2, buffer,rbuf,tbuf, len, b);

    for (row =b, idx=0; idx < len; row +=bytes, idx++)
    {
      gint value = (int) (image_gamma.g_inv(data[idx])*255.0+0.5);
      dest[row] = CLAMP( value, 0, 255);
    }
  }


}

static void
noise_filter (GimpDrawable *drawable,
              gdouble       radius,
              gdouble       lsmooth)
{
  GimpPixelRgn srcPR, destPR;
  gint         x1, y1, x2, y2;

  /* initialize pixel regions */
  gimp_pixel_rgn_init (&srcPR, drawable,
                       0, 0, drawable->width, drawable->height, FALSE, FALSE);
  gimp_pixel_rgn_init (&destPR, drawable,
                       0, 0, drawable->width, drawable->height, TRUE, TRUE);

  /* Get the input */
  gimp_drawable_mask_bounds (drawable->drawable_id, &x1, &y1, &x2, &y2);

  unsharp_region (&srcPR, &destPR, drawable->bpp,
                  radius, lsmooth,
                  x1, x2, y1, y2,
                  TRUE);

  gimp_drawable_flush (drawable);
  gimp_drawable_merge_shadow (drawable->drawable_id, TRUE);
  gimp_drawable_update (drawable->drawable_id, x1, y1, x2 - x1, y2 - y1);
}


/* Remove noise on the region, given a source region, dest.
 * region, width and height of the regions, and corner coordinates of
 * a subregion to act upon.  Everything outside the subregion is unaffected.
 */
static void
unsharp_region (GimpPixelRgn *srcPR,
                GimpPixelRgn *destPR,
                gint          bytes, /* Bytes per pixel */
                gdouble       radius,
                gdouble       lsmooth,
                gint          x1,    /* Corners of subregion */
                gint          x2,
                gint          y1,
                gint          y2,
                gboolean      show_progress)
{
  guchar  *src;
  guchar  *dest;
  gint     width   = x2 - x1;
  gint     height  = y2 - y1;
  gfloat *data, *data2;
  gfloat *buffer=NULL;
  gint     row, col,i;
  gfloat prob = 0.0;
  gint w = (int)((radius*5+unsharp_params.lookahead+unsharp_params.damping+unsharp_params.phase) * 4.0 + 40.0);
  //  if (radius < unsharp_params.lookahead) w = unsharp_params.lookahead * 4.0 + 40.0;


  image_gamma.init(unsharp_params.gamma);
  texture_gamma.init(unsharp_params.texture+1.0);

  gfloat     csmooth =  unsharp_params.csmooth;
  if (csmooth >= 0.99) csmooth = 1.0; /* Raw Filter preview */

  if (show_progress)
    gimp_progress_init (_("Blurring..."));


  /* allocate buffers */
  src  = g_new (guchar, MAX (width, height) * bytes);
  dest = g_new (guchar, MAX (width, height) * bytes);
  data = g_new(gfloat, MAX (width, height) + 2*w);
  data2 = g_new(gfloat, MAX (width, height) + 2*w);
  buffer = g_new(gfloat, MAX (width, height) + 2*w);
  float *rbuf = g_new(float,MAX (width, height) + 2*w);
  float *tbuf = g_new(float,MAX (width, height) + 2*w);
  scratch = g_new(float,MAX (width, height) + 2*w);

  for (i=0;i<MAX(width,height)+2*w-1;i++) data[i]=data2[i]=buffer[i]=rbuf[i]=tbuf[i]=0.0;

  /* Initialize the damping filter coefficients */

  /* blur the rows */
  for (row = 0; row < height; row++)
  {
    gimp_pixel_rgn_get_row (srcPR, src, x1, y1 + row, width);
    memcpy(dest,src,width*bytes);
    //      gimp_pixel_rgn_get_row (srcPR, dest, x1, y1 + row, width);
    blur_line (data+w, data2+w, buffer+w, rbuf+w, tbuf+w, src, dest, width, bytes);
    gimp_pixel_rgn_set_row (destPR, dest, x1, y1 + row, width);

    if (show_progress && row % 8 == 0)
      gimp_progress_update ((gdouble) row / (3 * height));
  }

  /* blur the cols */

  for (col = 0; col < width; col++)
  {
    gimp_pixel_rgn_get_col (destPR, src, x1 + col, y1, height);
    gimp_pixel_rgn_get_col (srcPR, dest, x1 + col, y1, height);
    blur_line (data+w, data2+w, buffer+w, rbuf+w, tbuf+w, src, dest, height, bytes);
    gimp_pixel_rgn_set_col (destPR, dest, x1 + col, y1, height);

    if (show_progress && col % 8 == 0)
      gimp_progress_update ((gdouble) col / (3 * width) + 0.33);
  }

  if (show_progress)
    gimp_progress_init (_("Merging..."));

#define MERGE
#ifdef MERGE
  /* merge the source and destination (which currently contains
     the blurred version) images */
  

   gfloat t=csmooth;
    gfloat t2 = lsmooth;

    t*=t;  /* Easier adjustment for small values */
    t2*=t2;
    //gausst.init(t);
    //gausst2.init(t2);

for (row = 0; row < height; row++)
  {
    guchar *s = src;
    guchar       *d = dest;
    gfloat        value;
    gint          u, v;

    /* get source row */
    gimp_pixel_rgn_get_row (srcPR, src, x1, y1 + row, width);

    gimp_pixel_rgn_get_row (destPR, dest, x1, y1 + row, width);

    /* get dest row */
    /* combine the two */

 
    for (u = 0; u < width; u++)
    {
      gfloat dpix[3],spix[3];

      gfloat lum,red,green,blue;
      gfloat lum2,red2,green2,blue2;

      red = (gfloat) s[0]/255.0;
      if (bytes > 2)
      {
        green = (gfloat) s[1]/255.0;
        blue =  (gfloat) s[2]/255.0;
      }
      else  green = blue = red;

      spix[0] = red;
      spix[1] = green;
      spix[2] = blue;



      lum = (FR*red + FG*green + FB*blue);

      red2 = (gfloat) d[0]/255.0;
      if (bytes > 2)
      {
        green2 = (gfloat) d[1]/255.0;
        blue2 =  (gfloat) d[2]/255.0;
      }
      else  green2 = blue2 = red2;



      lum2 = (FR*red2 + FG*green2 + FB*blue2);
      /*
       * Calculate luminance error (contrast error) for filtered template.
       * This error is biggest, where edges are. Edges anyway cannot be filtered.
       * Therefore we can correct luminance error in edges without increasing noise.
       * Should be adjusted carefully, or not so carefully if you intentionally want to add noise.
       * Noise, if not colorized, /can/ look good, so this makes sense.
       */
      gfloat dl = lum - lum2;

      /* Multiply dl with first derivative of gamma curve divided by derivative value for midtone 0.5
       * So bright tones will be corrected more (get more luminance noise and -information) than darker values 
       * Because bright parts of image generally are less noisy, this is what we want.
       */
      //!!!dl *= mypow(lum2/0.5,lut_gamma-1.0);

      if (t2 >= 0.0) dl *= (1.0 - exp(-dl*dl/(2.0*t2*t2)));

      //       if (dl > p) dl = p;
      //       if (dl < -p) dl = -p;

      dpix[0] =   red2 + dl;
      dpix[1] = green2 + dl;
      dpix[2] =  blue2 + dl;

      for (v = 0; v < bytes; v++)
      {

        gfloat value = spix[v];
        gfloat fvalue = dpix[v];
        gfloat mvalue = (value + fvalue)/2.0;

        gfloat diff = (value) - (fvalue);

        /* Multiply diff with first derivative of gamma curve divided by derivative value for midtone 0.5
         * So midtones will stay unchanged, darker values get more blur and brighter values get less blur
         * when we increase gamma.
         */
        //!!!!diff *= mypow(mvalue/0.5,lut_gamma-1.0);

        /* Calculate noise probability for pixel
         * Ok, probably it's not probability but an
         * arbitrary curve ;-)
         * Probably we should provide a GUI-interface for this
         */


        if (t > 0.0) prob = exp(-diff*diff/(2.0*t*t));
        else prob = 0.0;


        if (t >= 0.99) prob = 1.0; /* Allow viewing of raw filter output */
        dpix[v] = value = fvalue * prob + value * (1.0 - prob);

      }


      value = dpix[0]*255.0+0.5;
      d[0] = (guchar) CLAMP(value,0,255);
      if (bytes > 2)
      {
        value = dpix[1]*255.0+0.5;
        d[1] = (guchar) CLAMP(value,0,255);
        value = dpix[2]*255.0+0.5;
        d[2] = (guchar) CLAMP(value,0,255);
      }
      d += bytes;
      s +=bytes;
    }

    if (show_progress && row % 8 == 0)
      gimp_progress_update ((gdouble) row / (3 * height) + 0.67);

    gimp_pixel_rgn_set_row (destPR, dest, x1, y1 + row, width);
  }
#endif
  if (show_progress)
    gimp_progress_update (0.0);
  g_free (data);
  g_free (data2);
  g_free (buffer);
  g_free (rbuf);
  g_free (tbuf);
  g_free (dest);
  g_free (src);
  g_free (scratch);
}

static gboolean
unsharp_mask_dialog (GimpDrawable *drawable)
{
  GtkWidget *dialog;
  GtkWidget *main_vbox;
  GtkWidget *preview;
  GtkWidget *table;
  GtkObject *adj;
  gboolean   run;

#define MAX_RAD 0
  #define F_THRESH 1
  #define TEXTURE 2
  #define SHARP 3
  #define CLIP 4
  #define L_AHEAD 5
  #define PHASE 6
  #define GAMMA 7
  #define LUM_TOL 8
  #define COL_TOL 9


  gimp_ui_init ("unsharp", TRUE);

  dialog = gimp_dialog_new (_("Dcam Noise 2 V "PLUG_IN_VERSION), "dcamnoise2-"PLUG_IN_VERSION,
                            NULL, (GtkDialogFlags) 0,
                            gimp_standard_help_func, "plug-in-dcamnoise2-"PLUG_IN_VERSION,

                            GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
                            GTK_STOCK_OK,     GTK_RESPONSE_OK,

                            NULL);

  main_vbox = gtk_vbox_new (FALSE, 12);
  gtk_container_set_border_width (GTK_CONTAINER (main_vbox), 12);
  gtk_container_add (GTK_CONTAINER (GTK_DIALOG (dialog)->vbox), main_vbox);
  gtk_widget_show (main_vbox);

  preview = gimp_drawable_preview_new (drawable,
                                       &unsharp_params.update_preview);
  gtk_box_pack_start (GTK_BOX (main_vbox), preview, TRUE, TRUE, 0);
  gtk_widget_show (preview);

  g_signal_connect (preview, "invalidated",
                    G_CALLBACK (preview_update),
                    NULL);

  table = gtk_table_new (3, 3, FALSE);
  gtk_table_set_col_spacings (GTK_TABLE (table), 6);
  gtk_table_set_row_spacings (GTK_TABLE (table), 6);
  gtk_box_pack_start (GTK_BOX (main_vbox), table, FALSE, FALSE, 0);
  gtk_widget_show (table);

  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, MAX_RAD,
                              _("_Filter max. Radius:"), SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.radius, 0.5, 50.0, 0.5, 0.5, 1,
                              TRUE, 0, 0,
                              NULL, NULL);
  // gimp_scale_entry_set_logarithmic(adj,TRUE);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.radius);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);

  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, LUM_TOL,
                              _("_Luminance tolerance:"), SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.lsmooth, 0.0, 1.0, 0.1, 0.1, 2,
                              TRUE, 0, 0,
                              NULL, NULL);

  gimp_scale_entry_set_logarithmic(adj,TRUE);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.lsmooth);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);

  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, COL_TOL,
                              _("_Color tolerance:"), SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.csmooth,
                              0.0, 1.0, 0.1, 0.1, 2,
                              TRUE, 0, 0,
                              NULL, NULL);

  gimp_scale_entry_set_logarithmic(adj,TRUE);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.csmooth);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);


  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, F_THRESH,
                              "_Filter Threshold:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.effect,
                              0.0, 1.0, 0.01, 0.01, 2,
                              TRUE, 0, 0,
                              NULL, NULL);
  gimp_scale_entry_set_logarithmic(adj,TRUE);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.effect);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);


  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, L_AHEAD,
                              "_Lookahead:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.lookahead,
                              0.5, 20.0, 0.01, 0.01, 2,
                              TRUE, 0, 0,
                              NULL, NULL);
  //gimp_scale_entry_set_logarithmic(adj,TRUE);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.lookahead);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);


  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, GAMMA,
                              "_Gamma:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.gamma,
                              0.02, 5.0, 0.01, 0.1, 2,
                              TRUE, 0, 0,
                              NULL, NULL);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.gamma);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);



  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, PHASE,
                              "_Phase Jitter damping:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.damping,
                              0.0, 20.0, 0.5, 0.5, 1,
                              TRUE, 0, 0,
                              NULL, NULL);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.damping);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);
#if 1
  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, CLIP,
                              "_Edge Erosion:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.phase,
                              0.0, 10.0, 1.0, 1.0, 0,
                              TRUE, 0, 0,
                              NULL, NULL);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.phase);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);
  //gimp_scale_entry_set_logarithmic(adj,TRUE);
#endif

  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, TEXTURE,
                              "_Texture Detail:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.texture,
                              -1.0, 1.0, 0.01, 0.1, 2,
                              TRUE, 0, 0,
                              NULL, NULL);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.texture);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);


  adj = gimp_scale_entry_new (GTK_TABLE (table), 0, SHARP,
                              "_Sharpness:", SCALE_WIDTH, ENTRY_WIDTH,
                              unsharp_params.sharp,
                              0.0, 1.0, 0.01, 0.1, 2,
                              TRUE, 0, 0,
                              NULL, NULL);

  g_signal_connect (adj, "value_changed",
                    G_CALLBACK (gimp_double_adjustment_update),
                    &unsharp_params.sharp);
  g_signal_connect_swapped (adj, "value_changed",
                            G_CALLBACK (gimp_preview_invalidate),
                            preview);
  // gimp_scale_entry_set_logarithmic(adj,TRUE);



  gtk_widget_show (dialog);

  run = (gimp_dialog_run (GIMP_DIALOG (dialog)) == GTK_RESPONSE_OK);

  gtk_widget_destroy (dialog);

  return run;
}

static void
preview_update (GimpPreview *preview)
{
  GimpDrawable *drawable;
  gint          x1, x2;
  gint          y1, y2;
  gint          x, y;
  gint          width, height;
  gint          border;
  GimpPixelRgn  srcPR;
  GimpPixelRgn  destPR;


  drawable =
    gimp_drawable_preview_get_drawable (GIMP_DRAWABLE_PREVIEW (preview));

  gimp_pixel_rgn_init (&srcPR, drawable,
                       0, 0, drawable->width, drawable->height, FALSE, FALSE);
  gimp_pixel_rgn_init (&destPR, drawable,
                       0, 0, drawable->width, drawable->height, TRUE, TRUE);

  gimp_preview_get_position (preview, &x, &y);
  gimp_preview_get_size (preview, &width, &height);

  /* enlarge the region to avoid artefacts at the edges of the preview */
  border = (int) (2.0 * unsharp_params.radius + 0.5);

  x1 = MAX (0, x - border);
  y1 = MAX (0, y - border);
  x2 = MIN (x + width  + border, (int) drawable->width);
  y2 = MIN (y + height + border, (int) drawable->height);

  unsharp_region (&srcPR, &destPR, drawable->bpp,
                  unsharp_params.radius, unsharp_params.lsmooth,
                  x1, x2, y1, y2,
                  FALSE);

  gimp_pixel_rgn_init (&destPR, drawable, x, y, width, height, FALSE, TRUE);
  gimp_drawable_preview_draw_region (GIMP_DRAWABLE_PREVIEW (preview), &destPR);

}