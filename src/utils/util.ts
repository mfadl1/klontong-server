export const offsetCalculator = (page: number, limit: number): number => {
    const offset = limit * page - limit;
    return offset;
};