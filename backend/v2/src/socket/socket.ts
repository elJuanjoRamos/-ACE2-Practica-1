export default class SocketServer {
    private static _instance: SocketServer;
    private io:any;

    public static getInstance() {
        return this._instance || ( this._instance = new this() );
    }

    constructor() {}

    public listenServer(socket:any) {
        this.io = socket;
        this.io.on('connection', (client:any) => {
            console.log("Usuario conectado :D");

            client.emit('enviarMensaje', {
                usuario: 'Administrador',
                mensaje: 'Bienvenido a la aplicación'
            })

            client.on('disconnect', () => {
                console.log("Cliente desconectado D:");
            })

            //LISTEN CLIENT
            client.on('enviarMensaje', (data:any, callback:any)=> {
                console.log(data);

                client.broadcast.emit('enviarMensaje', data)
            });

            client.on('refreshTemperatura', (data:any, callback:any)=> {
                client.broadcast.emit('refreshTemperatura', data)
            });
            client.on('refreshOxigeno', (data:any, callback:any)=> {
                client.broadcast.emit('refreshOxigeno', data)
            });
            client.on('refreshFrecuencia', (data:any, callback:any)=> {
                client.broadcast.emit('refreshFrecuencia', data)
            });

        })
    }

    public send() {
        this.io.emit('enviarMensaje', {
            saludar: 'Hola a BRODCAST'
        });
    }

    public sendTemperatura(id_usuario: any, data: any) {
        console.log(data);
        this.io.emit('refreshTemperatura', {
            satus: 200,
            ok: true,
            idUsuario: id_usuario,
            temperaturas: data
        });
    }
    public sendOxigeno(id_usuario: any, data: any) {
        console.log(data);
        this.io.emit('refreshOxigeno', {
            satus: 200,
            ok: true,
            idUsuario: id_usuario,
            oxigenos: data
        });
    }
    public sendFrecuencia(id_usuario: any, data: any) {
        console.log(data);
        this.io.emit('refreshFrecuencia', {
            satus: 200,
            ok: true,
            idUsuario: id_usuario,
            frecuencias: data
        });
    }

}