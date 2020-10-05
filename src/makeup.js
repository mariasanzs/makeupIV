class Maquillaje {
  function producto(n, c, t, p){
    this.nombre = n;
    this.categoria = c;
    this.tono = t;
    this.precio = p;
  }

  function getNombre(){
    return nombre;
  }

  function getCategoria(){
    return categoria;
  }

  function getTono(){
    return tono;
  }

  function getPrecio(){
    return precio;
  }
}
