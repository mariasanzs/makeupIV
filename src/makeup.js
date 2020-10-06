class Maquillaje {
  producto(n, c, t, p){
    this.nombre = n;
    this.categoria = c;
    this.tono = t;
    this.precio = p;
  }

   getNombre(){
    return nombre;
  }

  getCategoria(){
    return categoria;
  }

  getTono(){
    return tono;
  }

  getPrecio(){
    return precio;
  }
}
