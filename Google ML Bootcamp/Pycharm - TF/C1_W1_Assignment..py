import tensorflow as tf
import numpy as np

def house_model():

    xs = np.arange(0, 6, dtype = float)
    ys = 50 + 50 * xs

    model = tf.keras.Sequential()
#   model.add(tf.keras.layers.Flatten(input_shape = [1]))
#   model.add(tf.keras.layers.Dense(32))
    model.add(tf.keras.layers.Dense(1, input_shape = [1]))

    model.compile(optimizer = 'sgd', loss = 'mean_squared_error')

    model.fit(xs, ys, epochs = 1000)

    return model


model = house_model()
print(model.predict([6]))
