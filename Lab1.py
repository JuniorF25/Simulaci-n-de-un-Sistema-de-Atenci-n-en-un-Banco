from collections import deque  # Importamos deque para manejar la cola de clientes

class Banco:
    def __init__(self):
        """
        Constructor de la clase Banco.
        Se crean dos colas:
        - cola_prioritaria: Para clientes con prioridad (ej. personas mayores, con discapacidad).
        - cola_general: Para clientes normales.
        """
        self.cola_general = deque()  # Cola para clientes normales
        self.cola_prioritaria = deque()  # Cola para clientes prioritarios

    def agregar_cliente(self, nombre, prioritario=False):
        """
        Agrega un cliente a la cola correspondiente.
        Parámetros:
        - nombre: Nombre del cliente.
        - prioritario: Booleano que indica si el cliente tiene prioridad.
        """
        if prioritario:
            self.cola_prioritaria.append(nombre)  # Agrega a la cola prioritaria
            print(f" Cliente PRIORITARIO {nombre} agregado a la cola.")
        else:
            self.cola_general.append(nombre)  # Agrega a la cola normal
            print(f" Cliente {nombre} agregado a la cola.")

    def atender_cliente(self):
        """
        Atiende al siguiente cliente en la cola.
        - Si hay clientes prioritarios, los atiende primero.
        - Si no hay prioritarios, atiende a los clientes normales.
        - Si no hay nadie en la cola, muestra un mensaje de advertencia.
        """
        if self.cola_prioritaria:
            cliente = self.cola_prioritaria.popleft()  # Atiende al primer cliente prioritario
            print(f" Atendiendo a cliente PRIORITARIO: {cliente}")
        elif self.cola_general:
            cliente = self.cola_general.popleft()  # Atiende al primer cliente normal
            print(f" Atendiendo a cliente: {cliente}")
        else:
            print(" No hay clientes en la cola.")
            #1
            def mostrar_espera(self):
        """
        Muestra la cantidad de clientes en espera en ambas colas.
        También imprime la lista de clientes en cada cola.
        """
        total = len(self.cola_prioritaria) + len(self.cola_general)  # Cantidad total de clientes en espera
        print(f" Clientes en espera: {total}")
        print(f" Prioritarios: {list(self.cola_prioritaria)}")  # Muestra la cola de clientes prioritarios
        print(f" Generales: {list(self.cola_general)}")  # Muestra la cola de clientes normales

def menu():
    """
    Función principal que muestra un menú interactivo en la consola.
    Permite agregar, atender y visualizar clientes en espera.
    """
    banco = Banco()  # Se crea una instancia del banco para manejar la cola de clientes
    
    while True:  # Ciclo infinito hasta que el usuario decida salir
        print("\n--- Menú del Banco ---")
        print("1. Agregar cliente")
        print("2. Atender cliente")
        print("3. Mostrar cola de espera")
        print("4. Salir")
        opcion = input("Seleccione una opción: ")  # Captura la opción elegida

        if opcion == "1":  # Agregar cliente
            nombre = input("Ingrese el nombre del cliente: ")  # Solicita el nombre
            prioritario = input("¿Es cliente prioritario? (s/n): ").lower() == 's'  # Pregunta si es prioritario
            banco.agregar_cliente(nombre, prioritario)  # Llama al método para agregar cliente
        
        elif opcion == "2":  # Atender cliente
            banco.atender_cliente()
        
        elif opcion == "3":  # Mostrar clientes en espera
            banco.mostrar_espera()
        
        elif opcion == "4":  # Salir del programa
            print(" Saliendo del sistema...")
            break  # Termina el ciclo while
        
        else:
            print(" Opción no válida. Intente de nuevo.")  # Mensaje de error si la opción no es válida

# Ejecutar el menú principal
menu()