import tensorflow as tf
import numpy as np
from tensorflow import keras


def hw_function(x):
    y = 2 * x - 1
    return y


if __name__ == '__main__':
    model = tf.keras.Sequential(
        keras.layers.Dense(1, input_shape = [1]),
    )

    model.compile(optimizer = 'sgd', loss = 'mean_squared_error')

    xs = np.array([0, 1, 2, 3, 4, 5, 6], dtype = float)
    ys = hw_function(xs)

    model.fit(xs, ys, epochs = 500)

    print(model.predict([10.0]))
