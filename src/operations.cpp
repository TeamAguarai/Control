#include "operations.h"

namespace pampas
{
// ToDo: cambiar a Template
float remap(float value, float in_min, float in_max, float out_min, float out_max) {
	return out_min + (value - in_min) * (out_max - out_min) / (in_max - in_min);
}

}
