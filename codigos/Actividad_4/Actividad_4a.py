import numpy as np
import matplotlib.pyplot as plt

# --- Señal en el tiempo ---
t = np.linspace(0, 0.01, 2000)  # tiempo de 0 a 10 ms
s_t = (15) * (np.cos(2 * np.pi * 400 * t) + np.cos(2 * np.pi * 1600 * t))

# --- Espectro en frecuencia ---
f = np.array([-1600, -400, 400, 1600])       # frecuencias donde hay deltas
A = np.array([30 / 4, 30 / 4, 30 / 4, 30 / 4])  # amplitudes de las deltas

# --- Gráfico de la señal en el tiempo ---
plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.plot(t * 1000, s_t)
plt.title("Señal en el tiempo s(t)")
plt.xlabel("Tiempo [ms]")
plt.ylabel("Amplitud")
plt.grid(True)

# --- Gráfico del espectro en frecuencia ---
plt.subplot(1, 2, 2)
plt.stem(f, A, basefmt=" ")
plt.title("Espectro en frecuencia S(f)")
plt.xlabel("Frecuencia [Hz]")
plt.ylabel("Amplitud")
plt.grid(True)

plt.tight_layout()
plt.show()
