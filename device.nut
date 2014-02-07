
reset <- hardware.pin1;     // Reset line ; normally HIGH
reset.configure(DIGITAL_OUT_OD_PULLUP);

outel <- hardware.pin8;    // Output enable line; normally HIGH
outel.configure(DIGITAL_OUT_OD_PULLUP);

// Configure SPI for 74HC595
hardware.spi257.configure(SIMPLEX_TX | MSB_FIRST | CLOCK_IDLE_LOW, 400);

function clear(ignore) {
    reset.write(0);
    imp.sleep(0.1);
    reset.write(1);
}

function setMask(state) {
    outel.write(1);
    hardware.spi257.write(blob(state.tointeger()));
    outel.write(0);
}
