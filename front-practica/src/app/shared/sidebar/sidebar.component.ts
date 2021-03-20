import { Component, OnInit } from '@angular/core';
import {UsuarioService} from '../../service/usuario.service'
@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {
  data:any
  atleta:any
  coach:boolean = false
  atletaStr:String = ""
  fecha:Date = new Date();
  hora:String = '';
  constructor(private usuarioService: UsuarioService) { }

  ngOnInit(): void {
    this.getSingle()
    this.mueveReloj();
  }


  getSingle() {
    
    this.usuarioService.getSingle(Number(localStorage.getItem('currentId')))
    .subscribe((res) => {
      console.log(res)

      this.data = res
      if(this.data.tipo_usuario == "Coach"){

        this.coach = true
        if(Number(localStorage.getItem('idAtletaCoach'))!=0){
          this.usuarioService.getSingle(Number(localStorage.getItem('idAtletaCoach')))
          .subscribe((res) => {this.atleta = res;
          this.atletaStr = " de "+this.atleta.nombres},(error)=>{});console.log("Ha ocurrido un error.")
        }
      }else if(this.data.tipo_usuario == "Atleta"){
        this.coach = false
      }

    }, (error) => {
      console.log("Ha ocurrido un error.")
    });
  }

  mueveReloj(){ 
    let momentoActual = new Date() 
    let hora = momentoActual.getHours() 
    let minuto = momentoActual.getMinutes() 
    let segundo = momentoActual.getSeconds() 

    let horaImprimible = hora + " : " + minuto + " : " + segundo 

    this.hora = horaImprimible 

    //La función se tendrá que llamar así misma para que sea dinámica, 
    //de esta forma:
    setTimeout(() => {
      this.mueveReloj()
    }, 1000);

}


}
