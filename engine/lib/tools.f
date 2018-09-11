: dirkeys?  left? right? or up? or down? or ;
: dirkeysup?  <left> released  <right> released or  <up> released or  <down> released or ;
: vtbl  create  does>  swap cells + @ execute ;
: camx  cam 's x ;  : camy  cam 's y ;
