
module GSMPower where


-- /**@name Power control utility functions based on GSM 05.05 4.1.1 */
--
-- /** Power control codes for GSM400, GSM850, EGSM900 from GSM 05.05 4.1.1. */
-- static const int powerCommandLowBand[32] =
-- {
-- 	39, 39, 39, 37,	// 0-3
-- 	35, 33, 31, 29,	// 4-7
-- 	27, 25, 23, 21,	// 8-11
-- 	19, 17, 15, 13,	// 12-15
-- 	11, 9, 7, 5,	// 16-19
-- 	5, 5, 5, 5,		// 20-23
-- 	5, 5, 5, 5,		// 24-27
-- 	5, 5, 5, 5		// 28-31
-- };
--
-- /** Power control codes for DCS1800 from GSM 05.05 4.1.1. */
-- static const int powerCommand1800[32] =
-- {
-- 	30, 28, 26, 24,	// 0-3
-- 	22, 20, 18, 16,	// 4-7
-- 	14, 12, 10, 8,	// 8-11
-- 	6, 4, 2, 0,		// 12-15
-- 	0, 0, 0, 0,		// 16-19
-- 	0, 0, 0, 0,		// 20-23
-- 	0, 0, 0, 0,		// 24-27
-- 	0, 36, 24, 23	// 28-31
-- };
--
-- /** Power control codes for PCS1900 from GSM 05.05 4.1.1. */
-- static const int powerCommand1900[32] =
-- {
-- 	30, 28, 26, 24,	// 0-3
-- 	22, 20, 18, 16,	// 4-7
-- 	14, 12, 10, 8,	// 8-11
-- 	6, 4, 2, 0,		// 12-15
-- 	0, 0, 0, 0,		// 16-19
-- 	0, 0, 0, 0,		// 20-23
-- 	0, 0, 0, 0,		// 24-27
-- 	0, 0, 0, 0,		// 28-31
-- };
--
-- const int* pickTable()
-- {
-- 	unsigned band = gBTS.band();
--
-- 	switch (band) {
-- 		case GSM850:
-- 		case EGSM900:
-- 			return powerCommandLowBand;
-- 			break;
-- 		case DCS1800:
-- 			return powerCommand1800;
-- 			break;
-- 		case PCS1900:
-- 			return powerCommand1900;
-- 			break;
-- 		default: return NULL;
-- 	}
-- }
--
-- int decodePower(unsigned code)
-- {
-- 	static const int *table = pickTable();
-- 	assert(table);
-- 	return table[code];
-- }
--
-- /** Given a power level in dBm, encode the control code. */
-- unsigned encodePower(int power)
-- {
-- 	static const int *table = pickTable();
-- 	assert(table);
-- 	unsigned minErr = abs(power - table[0]);
-- 	unsigned code = 0;
-- 	for (int i=1; i<32; i++) {
-- 		unsigned thisErr = abs(power - table[i]);
-- 		if (thisErr==0) return i;
-- 		if (thisErr<minErr) {
-- 			minErr = thisErr;
-- 			code = i;
-- 		}
-- 	}
-- 	return code;
-- }
