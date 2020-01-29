# ChronalCalibration

ChronalCalibration is a proposition of solution to [Chronal Calibration](https://adventofcode.com/2018/day/1) problem.

My take is optimistic in the sense that I expect both the initial frequency and each data variation to be valid integers. The code can be expanded to manage more complex cases.

## Setup

Nothing to do! I've writen the code with elixir 1.9 but I won't be using any of the latest features of the language.

You can run the tests

```
$ mix test
```

## Documentation

The `ChronalCalibration` module is documented according to the hex-doc standard directly in the [the module file](./lib/chronal_calibration.ex).

## Give it a spin!

### Step 1

run

```
$ iex -S mix

iex> ChronalCalibration.computed_frequency(1)
1

iex> ChronalCalibration.computed_frequency(1, [2, 3])
6

iex> ChronalCalibration.computed_frequency(0, [1, 3, -2])
2
```

see [the module file](./lib/chronal_calibration.ex) for documentation.

